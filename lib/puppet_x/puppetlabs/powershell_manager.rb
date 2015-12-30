require 'open3'
require 'thread'

module PuppetX::Dsc
  class PowerShellManager
    attr_accessor :return_code

    @@instances = {}

    def self.instance(cmd)
      @@instances[:cmd] ||= PowerShellManager.new(cmd)
    end

    def initialize(cmd)
      process_init_lock = Mutex.new
      process_started = ConditionVariable.new

      @stdout_lock = Mutex.new
      @stdout_written = ConditionVariable.new

      @stdout_capture = []
      stdout_monitor_thread = nil

      process_init_lock.synchronize do
        @runner_thread = Thread.new do
          Open3::popen2(cmd) do |stdin, stdout, proc_thread|
            Puppet.debug "#{Time.now} #{cmd} is running as pid: #{proc_thread.pid}"

            @stdin = stdin
            @stdout = stdout
            stdin.sync = true
            stdout.sync = true

            stdout_monitor_thread = Thread.new do
              while !@stdout.eof? do
                @stdout_lock.synchronize do
                  begin
                    # this is necessary to ensure all output captured
                    @stdout.flush
                    while self.class.is_readable?(@stdout) do
                      l = @stdout.gets
                      Puppet.debug "#{Time.now} STDOUT> #{l}"
                      @stdout_capture << l
                    end
                  rescue => e
                    Puppet.debug "Could not read STDOUT: #{e}"
                  ensure
                    @stdout_written.signal()
                  end
                end
              end
            end

            process_started.signal()

            proc_thread.join
            stdout_monitor_thread.join
            @return_code = proc_thread.value
          end
        end
      end

      # block initializer until process started with popen
      process_init_lock.synchronize do
        process_started.wait(process_init_lock)
      end

      at_exit { exit }
    end

    def self.is_readable?(stream, timeout = 0.5)
      read_ready = IO.select([stream], [], [], timeout)
      read_ready && stream == read_ready[0][0]
    end

    def execute(powershell_code)
      # always need a trailing newline to ensure PowerShell parses code
      out = exec_read_result(<<-CODE
      $Error.Clear()
      $LASTEXITCODE = 0
      #{powershell_code}
      [Console]::Out.Flush()
      [Console]::Error.Flush()

      CODE
      )

      { :stdout => out }
    end

    def exit
      Puppet.debug "PowerShellManager exiting..."
      @stdin.puts "\nexit\n"
      @stdin.close
      @runner_thread.join
    end

    private

    def read_stdout
      output = ''
      @stdout_lock.synchronize do
        # should use readable?(@stdout) to avoid block / wait, but it races
        # assume stdout populated / don't use timeout or output misaligned
        @stdout_written.wait(@stdout_lock)
        output = @stdout_capture.join('')
      end

      output
    end

    def exec_read_result(powershell_code)
      # clear previously captured output
      @stdout_lock.synchronize { @stdout_capture.clear() }

      @stdin.puts(powershell_code)
      @stdin.flush()

      # read results from stdout
      read_stdout
    end
  end
end

require 'spec_helper_acceptance'

def verify_dsc_file_resource(dsc_resource, dsc_module, expect_ps_failure, expect_dsc_failure, dsc_props)
  assert_dsc_resource(
    dsc_resource,
    dsc_module,
    { Ensure: dsc_props[:dsc_ensure], DestinationPath: dsc_props[:dsc_destinationpath], Contents: dsc_props[:dsc_contents] },
    expect_ps_failure,
    expect_dsc_failure,
  )
end

describe 'Apply DSC "File" resource' do
  dsc_resource = 'file'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'A File Resource with Valid "DestinationPath" and "Contents" Specified' do
    let(:work_dir) { SecureRandom.uuid }
    let(:dsc_destinationpath) { "C:/#{work_dir}/test1.file" }

    before(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"New-Item -Path 'C:/#{work_dir}' -ItemType 'directory'\"")
    end

    after(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{work_dir} -Force -Recurse\"", expect_failures: true)
    end

    it "creates and remove a file resource on #{ENV['TARGET_HOST']}" do
      # Create the file
      dsc_props = {
        dsc_ensure: 'Present',
        dsc_destinationpath: dsc_destinationpath,
        dsc_contents: 'Cats go meow!',
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      apply_manifest(dsc_manifest)
      result = verify_dsc_file_resource(dsc_resource, dsc_module, true, false, dsc_props)
      result_string = strip_crln(result.stdout)
      expect(result_string).to match(%r{The destination object was found and no action is required})

      # Remove the file
      dsc_props = {
        dsc_ensure: 'Absent',
        dsc_destinationpath: dsc_destinationpath,
        dsc_contents: 'Cats go meow!',
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      apply_manifest(dsc_manifest)
      result = verify_dsc_file_resource(dsc_resource, dsc_module, true, false, dsc_props)
      result_string = strip_crln(result.stdout)
      expect(result_string).to match(%r{The destination object was not found and no action is required})
    end
  end

  context 'A DSC File Resource with Valid "DestinationPath" and "SourcePath" Specified' do
    let(:work_dir) { SecureRandom.uuid }
    let(:sourcepath) { 'source.file' }
    let(:destinationpath) { 'test2.file' }
    let(:source_file_contents) { 'Dogs go bark!' }

    before(:each) do
      create_windows_file("C:/#{work_dir}/", sourcepath, source_file_contents)
    end

    after(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{work_dir} -Force -Recurse\"", expect_failures: true)
    end

    it "creates a destination file from the source file on #{ENV['TARGET_HOST']}" do
      dsc_props = {
        dsc_ensure: 'Present',
        dsc_destinationpath: "C:/#{work_dir}/#{destinationpath}",
        dsc_sourcepath: "C:/#{work_dir}/#{sourcepath}",
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      apply_manifest(dsc_manifest)

      result = run_shell("powershell.exe -NoProfile -Nologo -Command \"cat C:/#{work_dir}/#{destinationpath}\"")
      expect(result.stdout).to match(source_file_contents)
    end
  end

  context 'File resource with Unicode fields' do
    # Due to round tripping UTF8 we need to set the manifest on the agent and then use puppet-apply
    context 'A DSC File Resource with Valid Unicode "Contents" Specified' do
      let(:work_dir) { SecureRandom.uuid }
      let(:test_file_name) { 'test3.file' }
      let(:test_manifest_name) { 'test_manifest.pp' }

      before(:each) do
        test_file_contents = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        dsc_props = {
          dsc_ensure: 'Present',
          dsc_destinationpath: "C:/#{work_dir}/#{test_file_name}",
          dsc_contents: test_file_contents.to_s,
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

        run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{work_dir} -Force -Recurse\"", expect_failures: true)

        create_windows_file("C:/#{work_dir}/", test_manifest_name, dsc_manifest)
      end

      after(:each) do
        run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{work_dir} -Force -Recurse\"", expect_failures: true)
      end

      it 'does not scramble UTF8 content in the destination file' do
        run_shell("puppet apply C:/#{work_dir}/#{test_manifest_name}") do |result|
          expect(result.stderr).not_to match(%r{Error:})
        end

        # Powershell SHA256 hash
        md5_result = run_shell("powershell.exe -NoProfile -Nologo -Command \"Get-FileHash C:/#{work_dir}/#{test_file_name}\"")
        test_file_md5_sum_regex = %r{A57D8BFFBA5EEF3BC09FC7B692046479F928B5254D94F313ED33ECC53B41}

        expect(md5_result.stdout).to match(test_file_md5_sum_regex)
      end
    end

    context 'File Resource with Valid Unicode "Destinationpath" Specified' do
      let(:work_dir) { SecureRandom.uuid }
      let(:test_manifest_name) { 'test_manifest.pp' }
      let(:test_file_name) { "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145" }

      before(:each) do
        dsc_props = {
          dsc_ensure: 'Present',
          dsc_destinationpath: "C:/#{work_dir}/#{test_file_name}",
          dsc_contents: '',
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

        create_windows_file("C:/#{work_dir}", test_manifest_name, dsc_manifest)
      end

      after(:each) do
        run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{work_dir} -Force -Recurse\"", expect_failures: true)
      end

      it "creates a file with Unicode characters in the name on #{ENV['TARGET_HOST']}" do
        run_shell("puppet apply C:/#{work_dir}/#{test_manifest_name}")
        run_shell("powershell.exe -NoProfile -Nologo -Command \"Test-Path C:/#{work_dir}/#{test_file_name}\"") do |result|
          expect(result.stdout).to match(%r{True})
        end
      end
    end

    context 'File Resource with Valid Unicode "SourcePath" Specified' do
      let(:work_dir) { SecureRandom.uuid }
      let(:test_file_name) { 'test4.file' }
      let(:source_file_name) { "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145" }
      let(:source_file_contents) { 'Dogs go woof!' }
      let(:test_manifest_name) { 'test_manifest.pp' }

      before(:each) do
        dsc_props = {
          dsc_ensure: 'Present',
          dsc_destinationpath: "C:/#{work_dir}/#{test_file_name}",
          dsc_sourcepath: "C:/#{work_dir}/#{source_file_name}",
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)
        test_manifest_name = 'test_manifest.pp'

        create_windows_file("C:/#{work_dir}/", test_manifest_name, dsc_manifest)
        create_windows_file("C:/#{work_dir}/", source_file_name, source_file_contents)
      end

      after(:each) do
        run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{work_dir} -Force -Recurse\"", expect_failures: true)
      end

      it "creates a file with Unicode characters in the SourcePath on #{ENV['TARGET_HOST']}" do
        run_shell("puppet apply C:/#{work_dir}/#{test_manifest_name}") do |result|
          expect(result.stderr).not_to match(%r{Error:})
        end
      end
    end
  end
end

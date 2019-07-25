require 'spec_helper_acceptance'

def verify_directory_resource(dsc_resource, dsc_module, expect_ps_failure, expect_dsc_failure, dsc_props)
  assert_dsc_resource(
    dsc_resource,
    dsc_module,
    { Ensure: dsc_props[:dsc_ensure], Type: dsc_props[:dsc_type], DestinationPath: dsc_props[:dsc_destinationpath] },
    expect_ps_failure,
    expect_dsc_failure,
  )
end

describe 'Apply DSC "File" (directory) resource' do
  dsc_resource = 'file'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'A Directory Resource with Valid "DestinationPath" Specified' do
    let(:dsc_destinationpath) { 'C:/test_dir' }

    before(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -Path #{dsc_destinationpath} -Force -Recurse\"", expect_failures: true)
    end

    after(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -Path #{dsc_destinationpath} -Force -Recurse\"", expect_failures: true)
    end

    it "should create and remove a directory resource on #{ENV['TARGET_HOST']}" do
      # Create the directory
      dsc_props = {
        dsc_ensure: 'Present',
        dsc_type: 'Directory',
        dsc_destinationpath: dsc_destinationpath,
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      apply_manifest(dsc_manifest)
      result = verify_directory_resource(dsc_resource, dsc_module, true, false, dsc_props)
      result_string = strip_crln(result.stdout)
      expect(result_string).to match(%r{The destination object was found and no action is required})

      # Destroy the directory
      dsc_props = {
        dsc_ensure: 'Absent',
        dsc_type: 'Directory',
        dsc_destinationpath: dsc_destinationpath,
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      apply_manifest(dsc_manifest)
      result = verify_directory_resource(dsc_resource, dsc_module, true, false, dsc_props)
      result_string = strip_crln(result.stdout)
      expect(result_string).to match(%r{cannot find the file specified})
    end
  end

  context 'DSC File (Directory) Resource with "Recurse" Enabled' do
    let(:sourcepath) { 'source_dir' }
    let(:destinationpath) { 'test_dir' }
    let(:test_dirs) { Array.new(3) { |n| "sub_dir_test_#{n}" } }

    before(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"New-Item -Path 'C:/#{sourcepath}' -ItemType 'directory'\"")
      run_shell("powershell.exe -NoProfile -Nologo -Command \"New-Item -Path 'C:/#{sourcepath}/#{test_dirs[0]}' -ItemType 'directory'\"")
      run_shell("powershell.exe -NoProfile -Nologo -Command \"New-Item -Path 'C:/#{sourcepath}/#{test_dirs[1]}' -ItemType 'directory'\"")
      run_shell("powershell.exe -NoProfile -Nologo -Command \"New-Item -Path 'C:/#{sourcepath}/#{test_dirs[2]}' -ItemType 'directory'\"")

      run_shell("Remove-Item -path C:/temp/#{destinationpath} -Force -Recurse", expect_failures: true)
    end

    after(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{sourcepath} -Force -Recurse\"", expect_failures: true)
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{destinationpath} -Force -Recurse\"", expect_failures: true)
    end

    it "creates directories from source to destination recursively on #{ENV['TARGET_HOST']}" do
      dsc_props = {
        dsc_ensure: 'Present',
        dsc_type: 'Directory',
        dsc_destinationpath: 'C:/' + destinationpath,
        dsc_sourcepath: 'C:/' + sourcepath,
        dsc_recurse: 'true',
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      apply_manifest(dsc_manifest, expect_changes: true)

      test_dirs.each do |testdir|
        run_shell("powershell.exe -NoProfile -Nologo -Command \"Test-Path C:/#{destinationpath}/#{testdir}\"") do |result|
          expect(result.stdout).to match(%r{True})
        end
      end
    end
  end

  context 'DSC File (Directory) Resource with Valid Unicode "DestinationPath" Specified' do
    let(:test_manifest_name) { 'test_manifest.pp' }
    let(:test_dir_name) { "\u1134\u1169\u1185\u1173\u112D\u1117\u1114\u1135\u114E" }

    before(:each) do
      dsc_props = {
        dsc_ensure: 'Present',
        dsc_type: 'Directory',
        dsc_destinationpath: "C:/#{test_dir_name}",
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_resource, dsc_props)

      create_windows_file('C:/temp', test_manifest_name, dsc_manifest)
    end

    after(:each) do
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/#{test_dir_name} -Force -Recurse\"", expect_failures: true)
      run_shell("powershell.exe -NoProfile -Nologo -Command \"Remove-Item -path C:/temp/#{test_manifest_name} -Force -Recurse\"", expect_failures: true)
    end

    it "should create a directory with Unicode characters in the name on #{ENV['TARGET_HOST']}" do
      run_shell("puppet apply C:/temp/#{test_manifest_name}") do |result|
        expect(result.stderr).not_to match(%r{Error:})
      end

      run_shell("powershell.exe -NoProfile -Nologo -Command \"Test-Path C:/#{test_dir_name}\"") do |result|
        expect(result.stdout).to match(%r{True})
      end
    end
  end
end

# rubocop:disable Style/ClassAndModuleChildren
module Dsc
  # Document the generated types
  class DocumentBuilder < Manager
    def document_types(markdown_file_path)
      puts "Creating #{markdown_file_path}"
      File.open(markdown_file_path.to_s, 'w+') do |file|
        file.write("## Resource Types included with DSC module\n")
        file.write("For any system this module is installed on, use\n`Puppet describe typename` for more information.\n\n")

        file.write("#### WMF Core Types\n\n")
        file.write("Puppet Type | DSC Resource\n")
        file.write("----------- | -----------------\n")
        resources.select { |t| t.instance_name.downcase.match(%r{dsc_[^x]}) }.each do |dsc_type|
          pth = File.dirname(dsc_type.relative_mof_path.gsub(%r{import\/dsc_resources}, 'lib/puppet_x/dsc_resources'))
          file.write("dsc_#{dsc_type.friendlyname.downcase} | [#{dsc_type.friendlyname}](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/#{pth}) | #{dsc_type.relative_mof_path}\n")
        end

        file.write("\n#### Community x Prefixed types\n\n")
        resources.select { |t| t.instance_name.downcase.match(%r{dsc_x}) }.group_by { |dt| dt.ps_module.name }.each do |dsc_type|
          file.write("##### #{dsc_type[0]}\n\n")
          file.write("Puppet Type | DSC Resource | Github Repo\n")
          file.write("----------- | ----------------- | -----\n")
          dsc_type[1].each do |sb|
            pth = File.dirname(sb.relative_mof_path.gsub(%r{import\/dsc_resources}, 'lib/puppet_x/dsc_resources'))
            file.write(
              "dsc_#{sb.friendlyname.downcase} | [#{sb.friendlyname}](https://github.com/puppetlabs/puppetlabs-dsc/tree/master/#{pth}) | [repo](https://github.com/PowerShell/#{dsc_type[0]})\n",
            )
          end
          file.write("\n")
        end
      end
    end
  end
end

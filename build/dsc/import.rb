require 'open-uri'
require 'zip'

module Dsc
  class Import

    def self.download(remote_path, output_file)
      unless File.exist?(output_file)
        FileUtils.mkdir_p(File.dirname(output_file))
        open(output_file, 'wb') do |fo|
          fo.print open(remote_path).read
        end
      else
        puts "Skipping download. #{output_file} already downloaded."
      end
    end

    def self.unzip(file, destination)
      unless File.exist?(destination)
        Zip::File.open(file) { |zip_file|
          zip_file.each { |f|
            f_path=File.join(destination, f.name)
            FileUtils.mkdir_p(File.dirname(f_path))
            zip_file.extract(f, f_path) unless File.exist?(f_path)
          }
        }
      else
        puts "Skipping unzip. #{file} already unziped"
      end
    end

  end
end

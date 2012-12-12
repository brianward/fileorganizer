require 'FileUtils'

class Organize

	attr_accessor :directory_path

	def initialize
		# create tests
		# what does "full documentation" mean?
		# integrate with Travic CI 
		@directory_path = '/Users/brianward/Sites/filetest/'
	end

	def directory_files
		files_sorted_by_time = Dir["#{directory_path}**/*.*"].sort_by{ |f| File.ctime(f) }
	end

	def rename_files
		int = 100000
		directory_files.each do |filename|
			file_date = File.mtime(filename).to_s
			if !/\d{4}\-\d{2}\-\d{2}/.match(filename[10])
				if File.exist?(directory_path + file_date + filename[-4,4])
			    	File.rename(filename, directory_path + file_date + '_' + int.to_s + filename[-4,4])
			    	int += 1
			    else
			    	File.rename(filename, directory_path + file_date + filename[-4,4])
			    end
			end
		end
	end

	def move_files
		# loop over the file dates and run "mkdir" for those dates that don't have a folder yet
		directory_files.each do |filename|
			folder_name = filename.split('/').last[0,10]
			Dir.mkdir(directory_path + folder_name) unless Dir.exists?(directory_path + folder_name)
			puts directory_path + folder_name
			FileUtils.mv(filename, directory_path + folder_name)
		end
	end
	
end
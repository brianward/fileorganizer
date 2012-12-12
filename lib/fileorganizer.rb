require 'organize.rb'

newTask = Organize.new
puts "Do you want to run this script starting in your current directory (y/n)? (#{Dir.pwd}/)"
if gets.strip == 'y'
	newTask.directory_path = Dir.pwd + '/'
else
	puts "Enter the full directory path to the files you'd like to organize"
	newTask.directory_path = gets.strip
end
puts newTask.directory_files
newTask.directory_files.each do |filename|
	puts filename
end
puts "Rename & move files? (y/n)"
if gets.strip == 'y'
	newTask.rename_files
	newTask.move_files
	newTask.directory_files.each do |filename|
		puts filename
	end
	puts "Done."
else
	puts "Okay, come back later then."	
end



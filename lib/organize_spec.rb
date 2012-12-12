require './organize.rb'

describe Organize do

	before :all do
		@newTask = Organize.new
		@newTask.directory_path = Dir.pwd + "/testfiles/"
	end

	after(:all) do
	    # FileUtils.rm_rf(@newTask.directory_path)
	    # current_directory = Dir.pwd
	    # FileUtils.cp_r(current_directory + '/testfiles_copy', current_directory + '/testfiles/')
	 end

	it "should have a directory path" do
		@newTask.should respond_to "directory_path"
	end

	it "should return a list of existing files in directory" do
		existing_files = Dir[@newTask.directory_path + '**/*.*'].map { |a| File.basename(a) }
		existing_files.should eq ["ben easy street.jpg", "mirror.jpg", "P1080679.jpg", "P1080689.jpg", "P1080693.jpg"]
	end

	it "should rename the existing files in directory" do
		@newTask.rename_files
		new_files = Dir[@newTask.directory_path + '**/*.*'].map { |a| File.basename(a) }
		new_files.should eq ["2011-01-04 20:30:05 -0800.jpg", "2011-06-02 07:25:05 -0700.jpg", "2012-11-19 17:21:59 -0800.jpg", "2012-11-19 17:22:31 -0800.jpg", "2012-11-19 17:23:47 -0800.jpg"]
	end

	it "should create new folders from dates" do
		@newTask.move_files
		new_folders = Dir[@newTask.directory_path + '*/'].map { |a| File.basename(a) }
		new_folders.should eq ["2011-01-04", "2011-06-02", "2012-11-19", "test"]
	end

end

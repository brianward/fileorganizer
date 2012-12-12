require './lib/organize.rb'

describe Organize do

	before :all do
		@newTask = Organize.new
		@newTask.directory_path = File.expand_path("./lib/testfiles/",Dir.pwd) << '/'
	end

	after(:all) do
	    FileUtils.rm_rf(@newTask.directory_path)
	    FileUtils.cp_r File.expand_path("../testfiles_copy",@newTask.directory_path), @newTask.directory_path, :preserve => true
	 end

	it "should have a directory path" do
		@newTask.should respond_to "directory_path"
	end

	it "should return a list of existing files in directory" do
		existing_files = Dir[@newTask.directory_path + '**/*.*'].map { |a| File.basename(a) }
		existing_files.should eq ["4471473910_14e267969c.jpg", "4474268581_2b1ebba1c1.jpg", "4477744959_27ba8a402b_z.jpg", "5241024543_4d024eaa09_b.jpg", "5241024587_9ce803aafe_b.jpg", "5241619844_a02287bb21_b.jpg", "5241620170_91d55ef233_o.jpg", "5384868249_80bcb10aa2_b.jpg", "photo (1).JPG", "photo (2).JPG", "photo.JPG", "0f8109ddc4c5d699bbf4d9fbef2bcfcb.jpg", "3e54bfc519c423f3aa3b67d46d2684f4.jpg"]
	end

	it "should rename the existing files in directory" do
		@newTask.rename_files
		new_files = Dir[@newTask.directory_path + '**/*.*'].map { |a| File.basename(a) }
		new_files.should eq ["2011-02-04 14:31:58 -0800.jpg", "2011-02-04 14:34:42 -0800.jpg", "2011-02-04 14:35:32 -0800.jpg", "2011-02-04 14:35:48 -0800.jpg", "2011-02-04 14:35:56 -0800.jpg", "2011-02-04 14:37:02 -0800.jpg", "2011-02-04 14:37:26 -0800.jpg", "2011-02-04 14:37:58 -0800.jpg", "2011-02-21 10:55:15 -0800.jpg", "2011-02-21 10:56:09 -0800.jpg", "2011-03-19 22:24:33 -0700.JPG", "2011-03-19 22:24:45 -0700.JPG", "2011-03-19 22:24:56 -0700.JPG"]
	end

	it "should create new folders from dates" do
		@newTask.move_files
		new_folders = Dir[@newTask.directory_path + '*/'].map { |a| File.basename(a) }
		new_folders.should eq ["2011-02-04", "2011-02-21", "2011-03-19", "testfolder"]
	end

	it "should delete old folders that are now dates" do
		@newTask.delete_non_date_folders
		new_folders = Dir[@newTask.directory_path + '*/'].map { |a| File.basename(a) }
		new_folders.should eq ["2011-02-04", "2011-02-21", "2011-03-19"]
	end

end

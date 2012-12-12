fileorganizer
=============

Renames files using the creation date and groups them into folders by date

WHAT IT DOES:

All files, including subfolders, are searched and organized into folders with naming convention of "YYYY-MM-DD". All files are renamed with the convention of "YYYY-MM-DD hour/minute/second -0800_1#####" where the last five digits increment if a duplicate filename. Any files that already have a name starting with the "YYYY-MM-DD" format will NOT be renamed, but will still be moved/organized into their corresponding folder.

HOW IT WORKS:

Install gem

CLI asks if you'd like to run the script starting from it's installed directory. If "n" (no) is selected then it will ask in which directory (full path) you'd like to search and organize files. It will then display all current files in this directory for review.

CLI then asks if you want to proceed with renaming the listed files and organizing them into folders. If "y" (yes) then the program will proceed. Once completed it will list out all the new files that have been renamed and the new folders that they have been moved into.

ISSUES:

When this gem is run against any file it will rename the file using the date value from the "File.ctime" method. Unfortunately after changing the filename of a file the "ctime" will then be updated to the time the filename was changed. 

I have (so far) not been able to find a solution to this issue (at least for OSX) that keeps the "File.ctime" value in place even after renaming - including setting the "preserve" attribute when using the "File.rename" method (which simply blew up the rename method on OSX "Moutain Lion"). This unfortunately means that this code can not effectively be run against a file without the date associated with the file being changed. 

A check has therefore been put in place so that the file will not be renamed if it's filename begins with the "YYYY-MM-DD" naming convention. Without this check a previously renamed file would simply get renamed again to the date that the previous rename took place.

Any ideas/solutions to the "File.ctime" issue when using the "File.rename" method would be much appreciated. Thx -B

RPSEC ISSUE:

Due to the same "copying files resets the File.ctime value" issue stated above, the Rspec "after" hook doesn't work properly as it copies the "testfiles_copy" image directory for use by the rpsec test. In doing so the File.ctime values of the "pre-organized" files are incorrect and will not match the values stated in the test. Therefore, after running each rspec test the "testfiles_copy" directory will need to be manually copied as "testfiles" in order to preserve the original File.ctime values. This is a pain in the butt (I know) but a necessecity until I find a solution to this issue. Sorry...
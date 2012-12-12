fileorganizer
=============

Renames files using the file modified date/time (File.mtime()) and groups them into folders by date

WHAT IT DOES:

All files, including subfolders, are searched and organized into folders with naming convention of "YYYY-MM-DD". All files are renamed with the convention of "YYYY-MM-DD hour/minute/second -0800_1#####" where the last five digits increment if a duplicate filename. Any files that already have a name starting with the "YYYY-MM-DD" format will NOT be renamed, but will still be moved/organized into their corresponding folder. The corresponding folders then inside the specified path then then also be removed.

HOW IT WORKS:

Install gem

CLI asks if you'd like to run the script starting from it's installed directory. If "n" (no) is selected then it will ask in which directory (full path) you'd like to search and organize files. It will then display all current files in this directory for review.

CLI then asks if you want to proceed with renaming the listed files and organizing them into folders. If "y" (yes) then the program will proceed. Once completed it will list out all the new files that have been renamed and the new folders that they have been moved into.
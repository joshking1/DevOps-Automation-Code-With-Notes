
#!/bin/bash

# specify the directory to be zipped
dir_to_zip="/opt"

# specify the name of the output zip file
zip_file_name="opt_files.zip"

# navigate to the directory
cd "$dir_to_zip"

# zip all files in the directory
zip -r "$zip_file_name" .

# confirm completion of the zip process
echo "All files in $dir_to_zip have been successfully zipped to $zip_file_name."

# YAPILACAKLAR
# Check if we are root privilage or not
# Which files are we going to back up. Please make sure to exist /home/ec2-user/data file
# Where do we backup to. Please crete this file before execute this script
# Create archive filename based on time
# Print start status message.
# Print end status message.
# Long listing of files in $dest to check file sizes.
# To set this script for executing in every 5 minutes, we'll create cronjob

backup_files="/home/ec2-user/data /home/ec2-user/myfolder" #/etc /boot /opt
dest="/mnt/backup"

time=$(date +"%Y_%m_%d_%H_%M")

hostname=$(hostname -s) # Linux makinalar icin
archive_file="${hostname}-${time}.tgz"

echo "archive process is started"

sudo tar -cvzf  ${dest}/${archive_file} ${backup_files}

echo "congrulations! backup is ready"

ls -lh ${dest}








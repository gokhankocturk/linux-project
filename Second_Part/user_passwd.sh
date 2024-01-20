# YAPILMASI GEREKENLER
# The username, password, and host for the account will be displayed.
# Make sure the script is being executed with superuser privileges.
# Get the username (login).
# Get the real name (contents for the description field).
# Get the password.
# Create the account.
# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
# Set the password.
# Check to see if the passwd command succeeded.
# Force password change on first login.
# Display the username, password, and the host where the user was created.

echo $UID # Root yetkisine sahip olmadığı için 0 sonucunu vermeyecektir.
id -u

sudo su - # Roota geç
echo $UID # Root yetkisine sahip olduğu için 0 sonucunu verecektir.
id -u

if [ "${UID}" -ne 0 ];
then
    echo "Please run this script with sudo or root."
    exit 1
fi

read -p "Enter the username to create : " USERNAME
read -p "Enter the profession of the person or application that will be using this account : " COMMENT
read -sp "Enter the password to user for the account :" PASSWORD

useradd -m -c "${COMMENT}" -p $(echo $PASSWORD | openssl passwd -6 -stdin) ${USERNAME}

if [ "$?" -eq 0 ];
then 
    echo -e "\nThis username and password have been successfully added."
    echo "Here : $(tail -1 /etc/passwd)"
else
    echo "This username is already exist. Please select different username."
    exit 1
fi

passwd -e ${USERNAME} # Ilk giriste sifreyi degistirmeye zorluyor.

echo "${USERNAME}"
echo "${PASSWORD}"

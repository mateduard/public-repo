#!/bin/bash

# TASK 0
check_file_name() {
        file_path="$1"
        expected_file_name="$2"
        # Check filename
        echo -e  "\nTASK 0. Checking filename:"
        if [ "$(basename "$file_path")" = "$expected_file_name" ]; then
                echo "The file name is $expected_file_name"
        else
                echo "The file name is not $expected_file_name"
        fi
}

# Usage 0:
file_path="/etc/passwd"
expected_file_name="passwd"
check_file_name "$file_path" "$expected_file_name"

#TASK 1
echo -e "\nTask 1. Print home directory:"
echo "Home directory is: $HOME"

# TASK 2
passwd_file="/etc/passwd"
echo -e "\nTASK 2. List of users:"
# Internal Field Separator set to ":" as that is the format of the file. Then, we drop the rest of the line using the underscore and echo the username.  
while IFS=: read -r username _; do
            echo "$username"
    done < "$passwd_file"

# TASK 3
# To count the users it is sufficient to count the number of lines in the passwd file:
# We'll use the passwd_file variable defined at Task 2.
echo -e "\nTask 3. Number of users:"
line_count=$(wc -l < "$passwd_file")
echo "There are $line_count users."

# TASK 4
get_home_directory() {
        local input_username
        read -p "Enter a username: " input_username
        local username="$input_username"
        # getent- gets entry ; cuts with the ":" delimiter and picks the 6th field
        local home_directory=$(getent passwd "$username" | cut -d: -f6)
        # Check if the user (corresponding directory)  exists
        if [ -n "$home_directory" ]; then
            echo "Home directory of user $username: $home_directory"
        else
            echo "User $username does not exist."
        fi
}
# USAGE 4
echo -e "\nTask 4:"
get_home_directory

# TASK 5
list_users_by_uid_range() {
        local uid_start="$1"
        local uid_end="$2"
        # Print header
        echo "Users with UID in the range $uid_start-$uid_end:"
        # Read /etc/passwd and filter users
        while IFS=: read -r username _ uid _ _ _; do
                if [ "$uid" -ge "$uid_start" ] && [ "$uid" -le "$uid_end" ]; then
                    echo "$username (UID: $uid)"
                fi
        done < /etc/passwd
}

# USAGE 5
echo -e "\nTask 5"
list_users_by_uid_range 1000 1010

# TASK 6
list_users_with_standard_shells(){
  while IFS=: read -r username _ _ _ _ _ addr; do
    if [[ "$addr" == "/bin/bash" || "$addr" == "/bin/sh" ]]; then
      echo "$username has standard shell."
    fi
  done < /etc/passwd
}

# USAGE 6
echo -e "\nTask 6:"
list_users_with_standard_shells

# TASK 7
change_symbols(){
  local file_path="$1"
  echo "Redirected the text to /home/modified_passwd.txt"
  sed 's/\//\\/g' /etc/passwd > "$file_path"
}

# USAGE 7
echo -e "\nTask 7:"
# We can change the path and file to which the text is redirected.
change_symbols "/home/modified_passwd.txt"

# TASK 8
echo -e "\nTask 8:"
# In awk, the default separator is space anyway, so we let it unspecified:
priv_ip=$(ip a | grep inet | grep -v "127.0.0.1" | awk '{print $2}')
echo "$priv_ip"

# TASK 9
echo -e "\nTask 9:"
curr_user=$(whoami)
pub_ip=$(curl -s ifconfig.me | awk -F"$curr_user" '{print $1}')
echo "Public IP: $pub_ip"

# TASK 10
echo -e "\nTask 10:"
su john << EOF
# Execute as john:
echo "Switched to John user."

# TASK 11
echo -e "\nTask 11:"
echo "Home directory: $HOME"
echo -e "\nScript finished."
EOF

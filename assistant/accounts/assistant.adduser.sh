#!/bin/bash

# Set the username for the new user

USERNAME="assistant"

# Set the password for the new user

PASSWORD="my-password"

# Set the full name for the new user

FULL_NAME="Assistant"

# Set the home directory for the new user

HOME_DIRECTORY="/home/assistant"

# Set the shell for the new user

SHELL="/bin/bash"

# Set the groups for the new user

GROUPS="sudo,developers"

# Create the new user

useradd -m -d $HOME_DIRECTORY -s $SHELL -c "$FULL_NAME" $USERNAME

# Set the password for the new user

echo "$USERNAME:$PASSWORD" | chpasswd

# Add the user to the specified groups

for group in $(echo $GROUPS | sed "s/,/ /g")
do
  if ! getent group $group > /dev/null 2>&1; then
    groupadd $group
  fi
  usermod -a -G $group $USERNAME
done

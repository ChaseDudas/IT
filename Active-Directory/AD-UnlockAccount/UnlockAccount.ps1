###########################################################
# AUTHOR  : Chase Dudas
# CREATED : 7/12/2018
# Title   : Free Daryl
# COMMENT : "HELP", screams Daryl from his cubicle, "I got
#           locked out of my account again f***". 
#           This script unlocks the user using their ID in
#           active directory. It then sends them a popup 
#           message if you want to visually show the user 
#           that their account has been unlocked. 
# Need    : Target user's computer name and ID number from AD
###########################################################
# PARAMETERS
###########################################################

#Stores the name of the target user's computer in AD
$name = " "

#Stores the message you would like to send to the target user's computer
$msg = " "

#Stores the target user's ID from active directory, no quotations are needed. ex 112233
$uid = 

###########################################################
# MAIN 
###########################################################

#Calls invoke-wmimethod to send the pop up window to the target user's computer  
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * $msg" -ComputerName $name

#Calls unlock-adaccount to unlock the traget user's accoount in active directory 
Unlock-ADAccount -Identity $uid -Confirm

###########################################################
# END
###########################################################

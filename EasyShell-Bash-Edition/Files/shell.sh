#!/usr/bin/env bash

# Nikos Easy Shell
# EasyShell-Bash-Edition
# Made with .sh shellscript
# Author: NikosUniverse

#-------------
# VAR-LIST:
#  -username
#  -password
#  -registered
#  -new_un
#  -new_pw
#  -command
#  -pama
#  -installdo
#  -paname
#  -filename
#  -filetype
#  -filetoread
#-------------

#-------------
# SCRIPT:
#-------------
mkdir home
cd ./system
touch user.txt
touch pwd.txt


clear
    echo "----------------------------------------------------------------------------"
    echo "                          NikosUniverse - EasyShell                         "
    echo "                                   STARTUP                                  "
    echo "----------------------------------------------------------------------------"
    echo ""
    echo "MENU > If you are not registered here or want to reset your account, press [0], then [ENTER]!"
    echo "MENU > If you are already registered, press [1], then [ENTER]!"
    printf 'USER > '
    read -r registered

if [ "$registered" == "0" ]
then
    #menu (registration)
    clear
    echo "----------------------------------------------------------------------------"
    echo "                          NikosUniverse - EasyShell                         "
    echo "                                 REGISTRATION                               "
    echo "----------------------------------------------------------------------------"
    echo ""
    echo "MENU > Please enter your Username!"
    printf 'USER > '
    read -r username
    echo "MENU > Please enter your Password!"
    echo "IT IS IMPORTANT TO REMEMBER YOUR PASSWORD!"
    printf "$username > "
    read -r -s password
    #stores Username and Password
    echo "$username" > user.txt
    echo "$password" > pwd.txt
    registered="1"
    clear
else
    clear
fi


#login menu (login)
username=`cat user.txt`
password=`cat pwd.txt`
clear
echo "----------------------------------------------------------------------------"
echo "                          NikosUniverse - EasyShell                         "
echo "                                    LOGIN                                   "
echo "----------------------------------------------------------------------------"
echo ""
echo "ENTER YOUR USERNAME!"
printf 'USER > '
read -r new_un
if [ "$new_un" == "$username" ]
then
    echo "ENTER YOUR PASSWORD!"
else
    clear
    echo "WRONG USERNAME!"
    echo "Press [ENTER] to exit!"
    read startup2
    clear
    exit
fi
printf "$username > "
read -r -s new_pw
if [ "$new_pw" == "$password" ]
then
    clear
else
    clear
    echo "WRONG PASSWORD!!"
    echo "Press [ENTER] to exit!"
    read startup3
    clear
    exit
fi

#-----------------------------------------------------------------------------------------------
# MAIN PART
#-----------------------------------------------------------------------------------------------
#menu
menu()
{
clear
echo "----------------------------------------------------------------------------"
echo "                          NikosUniverse - EasyShell                         "
echo "logged in as: $username"
echo "----------------------------------------------------------------------------"
echo ""
echo "Press [Ctrl]+[C] or enter "quit" to exit!"
echo ""
printf "$username > "
read -r command

#help
if [ "$command" == "help" ]
then
    clear
    cat help.txt
    echo "Press [ENTER] to continue..."
    read startup4
    clear

#quit
elif [ "$command" == "quit" ]
then
    clear
    exit

#makefile
elif [ "$command" == "makefile" ]
then
    clear
    cd ..
    cd ./home
    echo "What will be the Name of the File? [eg. notes]"
    echo "(i) - DO NOT USE SPACES! Instead use Backslashes or _ !"
    printf "$username > "
    read -r filename
    echo "What will be the File Type? [eg. .txt, .sh]"
    printf "$username > "
    read -r filetype
    clear
    touch $filename$filetype
    clear
    echo "File "$filename$filetype" created!"
    sleep 2
    cd ..
    cd ./system
    clear

#fileview
elif [ "$command" == "fileview" ]
then
    clear
    cd ..
    cd ./home
    echo "What is the Name of the Document? [eg. notes.txt]"
    printf "$username > "
    read -r filetoread
    clear
    cat ./home/$filetoread
    echo ""
    echo ""
    echo "-------------------------------------------------"
    echo "  Press [ENTER] to continue..."
    echo ""
    read startup5
    cd ..
    cd ./system
    clear

#textedit


#install
elif [ "$command" == "install" ]
then
    clear
    echo "What Package Manager?"
    echo "(1) - Pacman"
    echo "(2) - Pamac"
    echo "(3) - yay"
    printf "$username > "
    read -r pama
    if [ "$pama" == "1" ]
    then
        echo "What do you want to do?"
        echo "(1) - Install"
        echo "(2) - Search"
        echo "(3) - Remove"
        printf "$username > "
        read -r installdo
        echo "Enter the Package Name"
        read paname
        echo "ENTER YOUR PASSWORD!"
        printf "$username > "
        read -r -s new_pw
        if [ "$new_pw" == "$password" ]
        then
            if [ "$installdo" == "1" ]
            then
                sudo pacman -S "$paname"
            elif [ "$installdo" == "2" ]
            then
                sudo pacman -Qs "$paname"
            elif [ "$installdo" == "3" ]
            then
                sudo pacman -R "$paname"
            fi
        fi
    elif [ "$pama" == "3" ]
    then
        echo "What do you want to do?"
        echo "(1) - Install"
        echo "(2) - Search"
        echo "(3) - Remove"
        printf "$username > "
        read -r installdo
        echo "Enter the Package Name"
        read paname
        echo "ENTER YOUR PASSWORD!"
        printf "$username > "
        read -r -s new_pw
        if [ "$new_pw" == "$password" ]
        then
            if [ "$installdo" == "1" ]
            then
                yay -S "$paname"
            elif [ "$installdo" == "2" ]
            then
                yay -Qs "$paname"
            elif [ "$installdo" == "3" ]
            then
                yay -R "$paname"
            fi
        fi
    elif [ "$pama" == "2" ]
    then
        echo "What do you want to do?"
        echo "(1) - Install"
        echo "(2) - Search"
        echo "(3) - Remove"
        printf "$username > "
        read -r installdo
        echo "Enter the Package Name"
        read paname
        echo "ENTER YOUR PASSWORD!"
        printf "$username > "
        read -r -s new_pw
        if [ "$new_pw" == "$password" ]
        then
            if [ "$installdo" == "1" ]
            then
                sudo pamac install "$paname"
            elif [ "$installdo" == "2" ]
            then
                sudo pamac search "$paname"
            elif [ "$installdo" == "3" ]
            then
                sudo pamac remove "$paname"
            fi
        fi
    fi
fi
}
for (( ; ; ))
do
   menu
done


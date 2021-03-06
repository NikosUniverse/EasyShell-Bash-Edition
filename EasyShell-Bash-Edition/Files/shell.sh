#!/usr/bin/env bash

#------------------------------------------------------------------------
# EasyShell-Bash-Edition
# Made with .sh shellscript
# Author: NikosUniverse
#
# https://github.com/NikosUniverse/EasyShell-Bash-Edition/
#------------------------------------------------------------------------

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
#  -filetodelete
#  -filetoedit
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
    cat $filetoread
    echo ""
    echo ""
    echo "-------------------------------------------------"
    echo "  Press [ENTER] to continue..."
    echo ""
    read startup5
    cd ..
    cd ./system
    clear

#removefile
elif [ "$command" == "removefile" ]
then
    clear
    cd ..
    cd ./home
    echo "What is the Name of the Document? [eg. notes.txt]"
    printf "$username > "
    read -r filetodelete
    clear
    rm $filetodelete
    clear
    echo "File "$filetodelete" deleted!"
    sleep 2
    cd ..
    cd ./system
    clear

#listfiles
elif [ "$command" == "listfiles" ]
then
  clear
  cd ..
  cd ./home
  ls -s
  echo ""
  echo ""
  echo "-------------------------------------------------"
  echo "  Press [ENTER] to continue..."
  echo ""
  read startup7
  cd ..
  cd ./system
  clear

#textedit
elif [ "$command" == "textedit" ]
then
    clear
    cd ..
    cd ./home
    echo "What is the Name of the Document? [eg. notes.txt]"
    printf "$username > "
    read -r filetoedit
    clear
    nano $filetoedit
    clear
    cd ..
    cd ./system
    clear

#coinflip
elif [ "$command" == "coinflip" ]
then
  clear
  FLIP=$(($(($RANDOM%10))%2))
    if [ $FLIP == 1 ]
    then
    echo "Tails"
  else
    echo "Heads"
  fi
  echo ""
  echo ""
  echo "-------------------------------------------------"
  echo "  Press [ENTER] to continue..."
  echo ""
  read startup8
  clear

#starwars
elif [ "$command" == "starwars" ]
then
    clear
    telnet towel.blinkenlights.nl
    clear

#update
elif [ "$command" == "update" ]
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
        clear
        sudo pacman -Syu
        clear
    elif [ "$pama" == "2" ]
    then
        clear
        sudo pamac update &&  sudo pamac upgrade
        clear
    elif [ "$pama" == "3" ]
    then
        clear
        echo "Updating is not available in YAY."
        sleep 3
        clear
    fi

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
                pamac install "$paname"
            elif [ "$installdo" == "2" ]
            then
                pamac search "$paname"
            elif [ "$installdo" == "3" ]
            then
                pamac remove "$paname"
            fi
        fi
    fi
fi
}
for (( ; ; ))
do
   menu
done

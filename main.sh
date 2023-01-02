#!/baphomate-inc/GConsole/main.sh
clear 
#../main 
main(){
    #../color
    red="\033[1;31m"
    grn="\033[1;32m"
    ylw="\033[1;33m"
    blu="\033[1;34m"
    pop="\033[1;35m"
    cyn="\033[1;36m"
    def="\033[0m"
    
    
    #________color_end
    ############################
    #../GConsole
    GCTermux(){ #__for termux
        packages="python python2 wget curl openssh"
        modules="requirements.txt"
        clear
        echo -e "$def [*]$cyn Reloading the terminal..."
        sleep 2 
        pkg update -y && pkg upgrade -y
        clear
        echo -e "$def [*]$cyn Installing the required packages..."
        sleep 2
        pkg isntall -y $packages
        clear
        echo -e "$blu"
        echo -e "GConsole Termux" | figlet
        read -p "[Press Enter to install"
        clear
        cd $HOME
        echo -e "$ylw Note: The support language for Termux is Python version 2.7"
        sleep 2
        apt install python2 openssh -y 
        export CLOUDSDK_PYTHON='python2.7'
        echo "export CLOUDSDK_PYTHON='python2.7'" >> ~/.bashrc
        echo "export PATH=$PATH:$PREFIX/google-cloud-sdk/bin"
        curl -o sdk.sh sdk.cloud.google.com
        chmod +x sdk.sh
        ./sdk.sh --install-dir=$PREFIX
        clear
        cp -rf data/gconsole $HOME/../usr/bin 
        chmod $HOME/../usr/bin/gconsole
        cd
        clear
        echo -e """
        $grn Done successfull installed
        $ylw Now open a new termux session 
        
        $ylw Type commands : gcloud auth login
        then follow the prompts.
        After that you can enter the ssh session
        with the command: gconsole
        
        $def Copyright ©2022 created by WarceuProject 
        $def Powered by Google Cloud and Baphomate Inc
        """
        
    } #__end for termux
    #____GConsole_end
    ###########################
    #loading 
    loading(){
        i=0
            while ((i < 100)); do
            printf "\r$def•[%3d%%]=> $blu Wait is Stabilizing the Program" $i
            ((i += RANDOM%5+2))
            # Of course, in real life, we'd be getting i from somewhere meaning>
            sleep 1
            done
        echo
    }
    #________loading_end
    #../banner
    banner(){
        clear
        echo -e "$cyn"
        echo -e "GConsole" | figlet
        echo -e "$def Google Console in terminal with ssh google cloud"
        echo -e "$def Created by WarceuProject from Baphomate Inc " 
    }
    #_______banner_end

    #../menu_home
    menu_home(){
        echo -e """ 
        Menu:
            $def 1.$ylw GConsole For Termux
            $def 2.$ylw GConsole for LinuxCLI
            $def 3.$ylw GConsole for Windows
            $def 4.$ylw GConsole for MAC 
            
            $def 0.$red Exit $def
        """
        read -p "[Chosse]: " c;
        if [[ $c == 1 ]]; then
            GCTermux
        elif [[ $c == 2 ]]; then 
            echo -e "$ylw This program is under construction"
            sleep 1
            banner
            menu_home
        elif [[ $c == 3 ]]; then 
            echo -e "$ylw This program is under construction"
            sleep 1
            banner
            menu_home
        elif [[ $c == 4 ]]; then 
            echo -e "$ylw This program is under construction"
            sleep 1
            banner
            menu_home
        elif [[ $c == 0 ]]; then 
            echo -e "$ylw Thank you for visiting ^_^"
            sleep 2
            exit
        else
            echo -e "$red (!)Wrong input!"
            sleep 1
            banner
            menu_home
        fi
        #__done_functions  
    }
    #_______menu_end
    loading
    banner
    menu_home
    
}
main
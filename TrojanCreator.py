#!/bin/env python3

#import
import os
import sys
import time



#define colors
#find color guide at "https://stackoverflow.com/questions/287871/how-to-print-colored-text-to-the-terminal"

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    PURPLE = '\033[35m'
    RED = '\033[31m'

#define other stuff for later [(choice):42?]

yes = {'yes','y', 'ye', ''}
no = {'no','n'}

#define option list:

op1 = {'1'}
op2 = {'2'}
op3 = {'3'}
op4 = {'4'}
op5 = {'5'}


#print logo & credits
credits = """

- GitHub: "https://github.com/Purpl3Dev?tab=repositories"
- Telegram "@PurpleGitDev"

"""
logo = """
 ____                   _      ____             
|  _ \ _   _ _ __ _ __ | | ___|  _ \  _____   __
| |_) | | | | '__| '_ \| |/ _ \ | | |/ _ \ \ / /
|  __/| |_| | |  | |_) | |  __/ |_| |  __/\ V / 
|_|    \__,_|_|  | .__/|_|\___|____/ \___| \_/  
                 |_|                            

"""

print(bcolors.PURPLE + logo + bcolors.ENDC)
print(bcolors.OKBLUE + credits + bcolors.ENDC)


print(bcolors.UNDERLINE + bcolors.WARNING + "this tool is a collection of Android / Windows trojan generators ")
print(bcolors.UNDERLINE + bcolors.WARNING + "using Metasploit Framework, use with caution." + bcolors.ENDC)
print()

#choice
print(bcolors.HEADER + "Do you really want to continue? [y/N]")

choice = input().lower()
if choice in yes:
   print("Let's start!")
   time.sleep(1.5)



elif choice in no:
   print('Exiting script...')
   time.sleep(0.4)
   print('Bye')
   time.sleep(1.5)
   exit()
else:
   sys.stdout.write("Please respond with 'yes' or 'no'")

#new windows shell
os.system("clear")
print(bcolors.PURPLE + logo + bcolors.ENDC)

#print list of all scripts:

print('Chose an option:')
print('1 - Android Trojan')
print('3 - Exit')

#option1

choice = input().lower()
if choice in op1:
   print('Option1 selected')
   os.system("bash ApkTroianCreator.sh")


if choice in op3:
   print('Exiting script...')
   exit()



#commands to execute shell command
#os.system("")

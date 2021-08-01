import os

with open('user_info.txt', 'r') as file:
    user_account_name = file.read().replace('\n', '')

#  Create SHOW THE FOLDERS functions
ShowDesktop = os.system('explorer "C:\\Users\\"'+user_account_name+'"\Desktop"')
ShowDownloads = os.system('explorer "C:\\Users\\"'+user_account_name+'"\Downloads"')
ShowDocuments = os.system('explorer "C:\\Users\\"'+user_account_name+'"\Documents"')

#  SHOW THE FOLDERS
ShowDesktop
ShowDownloads
ShowDocuments
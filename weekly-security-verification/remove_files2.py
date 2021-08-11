import os
import shutil

with open('user_info.txt', 'r') as file:
    user_account_name = file.read().replace('\n', '')

#  Set Filename Variables
desktop = 'C:/Users/'+user_account_name+'/desktop'

#  REMOVE THE FILES
try:
    for f in os.listdir(desktop):
        path = os.path.join(desktop, f)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)
except Exception as e:
    print("An exception occured: ", e)

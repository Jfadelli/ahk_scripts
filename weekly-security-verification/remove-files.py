import os
import shutil

#  RREMOVE THE FILES
desktop = 'C:/Users/Jason PBE/desktop'
documents = 'C:/Users/Jason PBE/documents'
downloads = 'C:/Users/Jason PBE/downloads'

try:
    for f in os.listdir(desktop):
        path = os.path.join(desktop, f)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)
except Exception as e:
    print("An exception occured: ", e)

try:
    for f in os.listdir(documents):
        path = os.path.join(documents, f)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)
except Exception as e:
    print("An exception occured: ", e)

try:
    for f in os.listdir(downloads):
        path = os.path.join(downloads, f)
        try:
            shutil.rmtree(path)
        except OSError:
            os.remove(path)
except Exception as e:
    print("An exception occured: ", e)
print('files removed')

#  SHOW THE FOLDERS
ShowDesktop = os.system('explorer "C:\\Users\Jason PBE\desktop"')
ShowDownloads = os.system('explorer "C:\\Users\Jason PBE\Downloads"')
ShowDocuments = os.system('explorer "C:\\Users\Jason PBE\Documents"')

ShowDesktop
ShowDownloads
ShowDocuments


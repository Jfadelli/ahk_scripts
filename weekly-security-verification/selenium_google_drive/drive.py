from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
from dotenv import load_dotenv
import os
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from datetime import date

#Setup
load_dotenv()
today = date.today()
CurrDate = today.strftime("%b %d, %Y")
browser = webdriver.Chrome(
    executable_path="C:\\Users\\Jason PBE\\projects\\selenium_testing\\chromedriver.exe")
browser.implicitly_wait(10)
browser.get(
    "https://drive.google.com/drive/folders/1P89sVSvvJWgXQdLt4fS0iTI9IYY9FMqQ")

try:
    print('Seeking UserName element...')
    UserName = browser.find_element_by_id("identifierId")
    UserName.send_keys(os.getenv("User"))
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
try: 
    print('Seeking LoginNextButton element...')
    LoginNextButton = browser.find_element_by_id("identifierNext")
    LoginNextButton.click()
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(4)
try:
    print('Seeking Password element...')
    Password = browser.find_element_by_xpath("//input[@type='password']")
    Password.send_keys(os.getenv("Password"))
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
try:
    print('Seeking PasswordNextButton element...')
    PasswordNextButton = browser.find_element_by_id("passwordNext")
    PasswordNextButton.click()
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(5)
try:
    print('Seeking NewButton element...')
    NewButton = browser.find_element_by_css_selector("button[aria-label='New']")
    NewButton.click()
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(1)
try:
    print('Seeking NewFolder element...')
    NewFolder = browser.find_element_by_css_selector("div[aria-label='Folder']")
    NewFolder.click()
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(1)
try:
    print('Seeking FolderNameInput element...')
    FolderNameInput = browser.find_element_by_xpath(
        "//div[@role='dialog']/div[2]/div[1]/input[1]")
    FolderNameInput.send_keys(CurrDate)
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(1)
try:
    print('Select Create Button')
    CreateButton = browser.find_element_by_xpath("//button[@name='ok']")
    CreateButton.click()
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(3)
try:
    TodaysFolder = browser.find_element_by_xpath("//div[@aria-label='"+ CurrDate + "']")
    action = ActionChains(browser)
    action.double_click(TodaysFolder).perform()
except Exception as e:
    print('An exception occured: ', e)
sleep(1)

try:
    print('Selecting + New, again.')
    NewButton.click()
    print('Success')
except Exception as e:
    print('An exception occured: ', e)
sleep(1)
try:
    FileUpload = browser.find_element_by_css_selector("div[aria-label='File upload']")
    FileUpload.click()
except Exception as e:
    print('An exception occured: ', e)
sleep(1)

# try:
#     print('Selecting FileUploadSelect')
#     FileUploadSelect = browser.find_element_by_xpath("//div[@aria-label='No files in this folder. Press c, use the new button, or drag and drop to add files to this folder.']")
#     Acc = os.getenv("ACC")
#     FilePath = f"c:\\users\\{Acc}\\desktop\\tmp\\Security Check {CurrDate}"
#     FileUploadSelect.send_keys(FilePath)
# except Exception as e:
#     print('An exception occured: ', e)


exit()
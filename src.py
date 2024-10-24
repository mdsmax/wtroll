import ctypes
import os
import requests

def check():
    response = requests.get(url="https://raw.githubusercontent.com/mdsmax/fefipefefotrolagem/refs/heads/main/working.txt")
    if "working" in response.text:
        return True
    else:
        return False

def set_wallpaper(image_path):
    working = check()
    if working == True:
        abs_path = os.path.abspath(image_path)
        ctypes.windll.user32.SystemParametersInfoW(20, 0, abs_path, 3)
    else:
        exit()


set_wallpaper("C:/Windows/System32/macaco.jpg")

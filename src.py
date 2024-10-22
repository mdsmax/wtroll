import ctypes
import os

def set_wallpaper(image_path):
    abs_path = os.path.abspath(image_path)
    ctypes.windll.user32.SystemParametersInfoW(20, 0, abs_path, 3)


set_wallpaper("C:/Windows/System32/macaco.jpg")

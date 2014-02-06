"""
Helper functions for offlineimap
"""

import locale
import re
import subprocess

encoding = locale.getdefaultlocale()[1]

exclusion_patterns = []

def get_password(name):
    """ Imports 'name' password from ``pass``"""
    command = ' '.join(["pass show", name])
    output = subprocess.check_output(command, shell=True)
    password_file = output.decode(encoding)
    return password_file.split('\n')[0]

def remote_to_local(remote_folder):
    return remote_folder.lower()

def local_to_remote(local_folder):
    return local_folder.capitalize()

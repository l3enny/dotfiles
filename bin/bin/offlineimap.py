"""
Helper functions for offlineimap
"""

import locale
import re
import subprocess

encoding = locale.getdefaultlocale()[1]

gtrans = [("[Gmail]/Drafts","Drafts"),
          ("[Gmail]/Sent Mail","Sent Mail"),
          ("[Gmail]/Spam","Spam"),
          ("[Gmail]/Trash","Trash")]

def get_password(name):
    """ Imports 'name' password from ``pass``"""
    command = ' '.join(["pass show", name])
    output = subprocess.check_output(command, shell=True)
    password_file = output.decode(encoding)
    return password_file.split('\n')[0]

def remote_to_local(remote_folder):
    for k, v in gtrans:
        if k == remote_folder:
            return v
    return remote_folder

def local_to_remote(local_folder):
    for k, v in gtrans:
        if v == local_folder:
            return k
    return re.sub('\.', '/', local_folder)

#I release this script under the CC0 license
#You can change to suit your purposes
#github.com/OSA413

import glob, os

os.linesep = "\n"

a = glob.glob("./**/*.sh", recursive = True)
a += glob.glob("./ffmpeg/**", recursive = True)

a = [x for x in a if os.path.isfile(x)]

for i in a:
    b = []
    with open(i, "r") as f:
        try:
            b = f.readlines()
        except:
            continue
    with open(i, "w", newline="\n") as f:
        f.writelines(b)

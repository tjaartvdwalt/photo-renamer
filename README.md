# Photo Renamer #
## What the script does ##
This script is fairly specific. It renames all .jpg files in a given directory to the form
IMG_*yyyymmdd*_*hhmmss*.jpg

## Rationale ##
The naming pattern described above is the naming pattern used by the stock Android camera.
This naming pattern allows me to seamlessly merge me photos taken from different devices into a directory and maintain chronology.
Unfortunately my camera does not support this naming pattern, and thus the need for this script.

## mtime ##
After some experimenting I found that if I copy photos from my camera's memory card to my PC the "Modify Time" field gets preserved. Therefore I use this field as the basis for renaming the files. Obviously if you modify the file before renaming the mtime field will get updated and your file name will be wrong, so be warned!

## usage ##


## GNU GPL ##
This program is licensed under [GNU GPL](http://www.gnu.org/licenses/gpl-3.0.txt)

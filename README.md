# Very simple WebAPI for Raspberry Pi camera to grab photo.

## Installation
sudo curl -sS https://raw.githubusercontent.com/darton/picamera/main/install.sh | bash 

### options
http://ipaddress/api/picamera.php

###  taking a photo
http://ipaddress/api/picamera.php?picture=grab&filename=filename.jpg

http://ipaddress/api/picamera.php?picture=grab&filename=filename.jpg&rotate=270&vertical_flip=yes&horizontal_flip=yes

###  delete a file
http://ipaddress/api/picamera.php?picture=delete&filename=filename.jpg

### files listing
http://ipaddress/api/picamera.php?picture=list

### url to the photo file
http://ipaddress/pictures/filename.jpg

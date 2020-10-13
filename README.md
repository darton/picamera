## Very simple WebAPI for Raspberry Pi camera to grab photo.

### Installing operating system images 

Download the image [Raspberry Pi OS Lite](https://downloads.raspberrypi.org/raspios_lite_armhf_latest)

To writing an image to the SD card, use [Etcher](https://etcher.io/) an image writing tool or use [Imager](https://www.raspberrypi.org/downloads/)

If you're not using Etcher, you'll need to unzip .zip downloads to get the image file (.img) to write to your SD card.

### Run installation script

Running the following command will download and run the script.
```
sudo curl -sS https://raw.githubusercontent.com/darton/picamera/main/install.sh | bash 
```

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

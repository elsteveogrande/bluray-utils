bluray-utils
============

Utilities for transferring your video camera's MP4 files in AVCHD format to the "official" blu-ray format, and for building a UDF disc image (on OSX) playable by a blu-ray player.

To convert AVCHD video files on OSX, use "avchd2bluray.sh".  Works on a Mac (tested on 10.6 through 10.8) and requires just bash.

To build a disc image suitable for burning with OSX's "Disk Utility" (it really just builds a UDF 2.5 image so you can probably use this / adapt it to be burned anywhere) use:

build-udf25.sh diskimagename

to build a file "diskimagename.img" which contains the disc image.

See the following URLs for more info.  I generally used just these when building these little scripts for myself.

(original URL might be gone; search Google's cache)
http://74.125.93.132/search?q=cache:Meaf0917ZyUJ:avchduser.com/articles/avchd_to_bluray.jsp+http://www.elurauser.com/articles/avchd_to_bluray.jsp&cd=1&hl=en&ct=clnk&gl=us

http://www.videohelp.com/forum/archive/how-to-burn-avchd-on-dvd-r-in-high-definition-for-br-set-top-playback-t350375.html



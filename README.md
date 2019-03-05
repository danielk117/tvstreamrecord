tvstreamrecord
==============

Program to record TV streams. Python required. Server runs at port 8030 (changeable)
See embedded About page or Wiki at GitHub for more information.


ffmpegbinder
=============

Script for binding virtual network interfaces to each ffmpeg process for tvstreamrecord. The script helps you if your iptv device/tuner only supports one connection per ip adress (e.g. FRITZ!Box or FRITZ!Repeater).
ffmpegbinder creates virtual interfaces with a own MAC und starting a dhcp client for getting an ip from your dchp server. The script was written for a Synology DS415+.

Download ffmpefbinder.sh and edit the first lines.

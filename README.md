# *************************   N-Vader   *******************************
N-Vader is a Wi-Fi hacking and network manipulation tool designed for ethical testing purposes. It includes features like Mac Flooding, Wifi Jamming, Wifi Key Grappling, Wifi Key Decipher, and Captive Portal Attack. The Viper script has been tested on Raspberry Pi 4 running Kali/Parrot OS. A sample video is also attached.
 
 ## Capabilities:
      (1) Mac Flooding.
      (2) Wifi Jamming.
      (3) Wifi Key Grappling.
      (4) Wifi Key Decipher.
      (5) Captive Portal Attack.
 ## Required Tools:
      (1) dsniff
      (2) aircrack-ng, airmon-ng, airodump-ng, aireplay-ng
      (3) gnome-terminal
      (4) netdiscover
      (5) fluxion along with its dependencies
 ## Commands to install the required tools(for debian):
      To install dsniff:
       sudo apt-get install dsniff
      To install gnome-terminal:
       sudo apt-get install gnome-terminal
      To install netdiscover:
       sudo apt-get install netdiscover
      To clone fluxion onto your system:
       git clone https://github.com/FluxionNetwork/fluxion.git
      To install aircrack-ng:
       sudo apt-get install aircrack-ng
   ### NOTE: airmon-ng, airodump-ng, aireplay-ng comes with aircrack-ng package.
   Solution to solve each time new terminal window asking for root user's password:
   https://vitux.com/always-launch-terminal-as-root-user-sudo-in-ubuntu/

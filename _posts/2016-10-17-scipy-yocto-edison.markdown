---
layout: post
title: Getting started with the Intel Edison
---

With the Sparkfun breakout blocks the Intel Edison becomes a compact, powerful, mechanically robust target board for robotics

Parts list:
- [Intel Edison](https://www.sparkfun.com/products/13024)
- [Sparkfun base block](https://www.sparkfun.com/products/13045)
- [Sparkfun 9DoF IMU block with the ST Micro LSM9DS0](https://www.sparkfun.com/products/13033)


Ubilinux has been a popular distribution for the Edison in the past. As of June 2016, Emutex no longer supports Ubilinux on Edison.

[Yocto](https://www.yoctoproject.org/) is the distribution 

# Installing Yocto:

Plug both cables into the base block

Update the firmware, create a password, and connect to wifi as described here:
[https://software.intel.com/en-us/get-started-edison-windows-step2](https://software.intel.com/en-us/get-started-edison-windows-step2)

Connect to the Edison using TeraTerm, putty, or GNU screen

Although branded as a system to compile custom OS images for your target board, Yocto also includes a conventional, apt-like package manager. No repositories are included by default, so you'll need to add them like so:

    echo "src/gz all http://repo.opkg.net/edison/repo/all"           >> /etc/opkg/base-feeds.conf
    echo "src/gz edison http://repo.opkg.net/edison/repo/edison"     >> /etc/opkg/base-feeds.conf 
    echo "src/gz core2-32 http://repo.opkg.net/edison/repo/core2-32" >> /etc/opkg/base-feeds.conf
    opkg update
    
A full list of packages  available through opkg can be found [here](http://repo.opkg.net/edison/repo/core2-32/)
    
# Installing Packages - numpy, pyplot, smbus and scipy:

We'll need the smbus package to communicate with the LSM9DS0. Git and screen will be convenient.

    opkg install git screen python-smbus
    
Scipy can be installed from pip. You’ll see some error messages about not having support for HTTPS, but that’s okay.
    
    pip install --upgrade pip
    pip install numpy scipy matplotlib

# Plotting Acceleration:

[<img src="/images/random/hello_imu.png" style="width: 200px;" align="right"/>](/images/random/hello_imu.png)

You'll need to find python drivers for the LSM9DS0. As of October 2016, you can find a driver [here](git clone https://github.com/oresat/reaction-wheels.git).
    
I've uploaded a python script to read and plot data from the IMU at this [gist](https://gist.github.com/fkoran/d46e720500a208c3bcbef88e03954f63)
    










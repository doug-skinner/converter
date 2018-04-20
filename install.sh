#!/bin/bash

# Install the EPEL repository for necessary packages
yum install epel-release -y

# Get pip installed
yum install python-pip -y

# Upgrade to the latest pip
pip install --upgrade pip

# Install the weberver framework
pip install Flask

# Install the python bindings for our downloader
pip install youtube-dl

# Install the command line wrappings for our downloader
yum install youtube-dl -y

# Add a repository that contains ffmpeg
rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

# Install ffmpeg
yum install ffmpeg ffmpeg-devel -y

# Install apache, and mods, the base web server that will sit in front of Flask
yum install httpd mod_wsgi -y

# Move the virtual host configuration file to where it needs to be
mv vhost.conf /etc/httpd/conf.d/.

# Modify the ownership of the config file so apache can read it
chcon system_u:object_r:httpd_config_t:s0 /etc/httpd/conf.d/vhost.conf

# Move the web files to the required directory
mv app.py /var/www/html/
mv app.wsgi /var/www/html/
mv static /var/www/html/
mv templates /var/www/html/

# Start apache
systemctl start httpd

# Enable apache to start on reboot
systemctl enable httpd

# Make sure the default firewall is started
systemctl start firewalld

# Enable the firewall to start on reboot
systemctl enable firewalld

# Allow port 80 through the firewall
firewall-cmd --permanent --add-service=http

# Reload the firewall with the new rule
firewall-cmd --reload


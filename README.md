# Converter

Converter is a simple web wrapper around the youtube-dl command line tool that allows one to download a youtube video into either an mp3 or mp4 file.
While I'm sure anyone browsing Github can easily run the youtube-dl script yourself, this is built for you to offer a solution for friends or family members.
There are many sites that offer the same functionality, but they are normally covered in ads and links to not so great sites, so you can host this one on your personal network to allow them to go to a trusted resource.

## Example
An example of the site can be found [here](http://converter.doug-skinner.com)

## To Host Yourself

Written as a simple Flask application, it can either be run locally after installing the required packages, or it is tested to run on a Centos 7 server.
An install script is included to make setup easier on a server.

### Instructions
Hosting your own copy of the software on a Centos 7 server is easy.

* Setup the Centos 7 server
* Run the following commands as root
  * `yum install git -y`
  * `git clone https://github.com/doug-skinner/converter.git`
  * `cd converter`
  * `./install.sh`
* After that script runs, you should be all set by navigating to the ip address of the server.

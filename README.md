PiWeb
=====

PiWeb is a Sinatra-based Ruby webapp to be installed on a Raspberry Pi in order to remotely control its GPIO pins. This allows to control relay modules to switch devices on and off.

## Installation Prerequisite

In order to install PiWeb on your Raspberry Pi, you first have to ensure that the WiringPi GPIO interface library is already installed. To check this, execute the following command on your Raspberry Pi using a SSH connection:

```
gpio -v
```

If the `gpio` command is not recognized, then you have to install WiringPi. To do so, follow the instructions given at the following link: http://wiringpi.com/download-and-install/

## Installation

To install PiWeb on your Raspberry Pi, execute the following command in the root directory of the application:

```
bundle install
```

## Configuration

Thanks to the Whenever Gem, the activation/deactivation of each GPIO pin may be croned at will. To do so, you have to schedule the switching in the file `config/schedule.rb`. Then, execute the following command in PiWeb's root directory:

```
$ whenever --update-crontab
```

In order to make the PiWeb webapp know which GPIO pin controls which device, you can configure your GPIO pins in the configuration file `config/config.yml`. Here is an example of configuration:

```
place: Home
devices:
 0: Living Room Lamp
 1: Bedroom Lamp
 2: CMV
```

## Make PiWeb a Service
If you want the PiWeb webapp to start automatically at boot time, you can copy the script `piweb` located in PiWeb's root directory in `/etc/init.d` and execute the following command:

```
sudo update-rc.d /etc/init.d/piweb defaults
```

Doing this will make PiWeb a service started at boot time. Then, you will be able to execute the following commands:

```
$ service piweb status
$ service piweb stop
$ service piweb start
$ service piweb restart
```

By default, the PiWeb webapp will use the port `15117`. To change this port, you have to modify it in the files `start.sh` and `piweb` (the one installed in `/etc/init.d` to make PiWeb a service).

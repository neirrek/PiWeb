PiWeb
=====

PiWeb is a Sinatra based Ruby webapp to be installed on a Raspberry Pi in order to remotely control the switch of a light using the host Raspberry Pi and a relay module.

Thanks to the Whenever Gem, the switching of the light may be croned at will. To do so, you have to schedule the switching in the file `config/schedule.rb`. Then, execute the following command in PiWeb's root directory:

```
$ wheneverize .
```

If you want the PiWeb webapp to start automatically at boot-time, you can copy the script `piweb` located in PiWeb's root directory in `/etc/init.d`. Doing this will make PiWeb a service. Then, you will be able to execute the following commands:

```
$ service piweb status
$ service piweb stop
$ service piweb start
$ service piweb restart
```

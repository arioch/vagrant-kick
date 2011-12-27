### Local tests
Anything inside $vmname.local will be executed on your local workstation.  
This could be used to test if certain ports or services are exposed from the virtual machine using e.g. Nagios plugins or nmap.


### Remote tests
Anything you put inside $vmname.local will be executed on your vm called $vmname, using SSH.  
The following test...

    $ cat tests/node01.ssh
    uptime

would return the same output as...

    $ ssh 192.168.1.10 "uptime"


### Basic usage
    $ ls vagrantproject/
    Vagrantfile
    tests/

    $ ls tests/
    node01.local
    node01.ssh
    node02.local
    node02.ssh

    $ cat tests/node01.local
    check_http -H 192.168.1.10 -p 80

    $ cat tests/node01.ssh
    uptime
    facter puppetversion
    facter facterversion


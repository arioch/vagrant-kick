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

    $ vagrant kick
    [node01] REMOTE
    [node01] uptime
    [node01] 23:47:27 up  2:36,  0 users,  load average: 0.00, 0.00, 0.00
    [node01] 
    [node01] facter puppetversion
    [node01] 2.6.6
    [node01] 
    [node01] facter facterversion
    [node01] 1.6.0

    [node01] LOCAL
    [node01] check_http -H 192.168.1.10 -p 80
    CRITICAL - Socket timeout after 10 seconds

### Installation
    $ rake install
    $ ls pkg/
    vagrant-kick-0.0.1.gem
    $ sudo gem install pkg/vagrant-kick-0.0.1.gem

or

    $ sudo rake install


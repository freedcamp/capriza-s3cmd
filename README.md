# S3cmd module for Puppet

This module manages s3cmd on Linux (RedHat/Debian) distros.

## Description

This module uses the fact osfamily which is supported by Facter 1.6.1+. If you do not have facter 1.6.1 in your environment, the following manifests will provide the same functionality in site.pp (before declaring any node):

    if ! $::osfamily {
      case $::operatingsystem {
        'RedHat', 'Fedora', 'CentOS', 'Scientific', 'SLC', 'Ascendos', 'CloudLinux', 'PSBM', 'OracleLinux', 'OVS', 'OEL': {
          $osfamily = 'RedHat'
        }
        'ubuntu', 'debian': {
          $osfamily = 'Debian'
        }
        'SLES', 'SLED', 'OpenSuSE', 'SuSE': {
          $osfamily = 'Suse'
        }
        'Solaris', 'Nexenta': {
          $osfamily = 'Solaris'
        }
        default: {
          $osfamily = $::operatingsystem
        }
      }
    }

## Usage

### s3cmd
Installs and configures s3cmd command line tool (http://s3tools.org/s3cmd).

    class {'s3cmd':
        aws_access_key => '*********************************',
        aws_secret_key => '*********************************',
        gpg_passphrase => 'gpg password for encryption',
        owner => 'owner',
    }

* Retrieve aws access and secret key from your aws account
* gpg_passphrase is a password used from encrypting and decrypting data. The passphrase is yours to choose.
* owner is the user that will run the s3cmd command. The s3cmd configuration file will be stored in users home directory

### s3cmd::commands::get
Downloads an object from s3.

s3cmd::commands::get{'local file':
  s3_object => 'https://s3.amazonaws.com/(bucket name)/(object name)',
  owner => 'owner',
}

* The name of the s3::commands::get is the local file name of the object you are retrieving
* s3_object is the https path to the s3 object
* owner is the owner of the s3cmd command. It is the same owner as declared in the s3cmd class.

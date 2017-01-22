class s3cmd::install (
  $version     = 'installed',
  $enable_repo = true,
) {
  if $enable_repo {
    case $::osfamily {
      'Redhat' : {
        file { '/etc/yum.repos.d/s3tools.repo':
          ensure    => file,
          owner     => 'root',
          group     => 'root',
          mode      => '0644',
          source    => "puppet:///modules/${module_name}/s3tools.repo",
          before    => Package['s3cmd'],
        }
      }
      default  : {
        fail("${::osfamily} is not supported")
      }
    }
  } else {
    file { '/etc/yum.repos.d/s3tools.repo':
      ensure    => absent,
      subscribe => Package['s3cmd'],
    }
  }

  package { 's3cmd': ensure => $version, }

}

define s3cmd::commands::get(
  $s3_object,
  $owner,
) {
  exec{$name:
     command => "s3cmd ${s3_object} ${name}",
     path=>'/usr/bin',
     user => $owner,
     creates => $name,
     require => Class['s3cmd::config','s3cmd::install'],
  }
}
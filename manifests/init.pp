class s3cmd (
  $aws_access_key,
  $aws_secret_key,
  $gpg_passphrase,
  $owner       = 'root',
  $enable_repo = true,
  $version     = 'installed',
) {

  class { 's3cmd::install':
    enable_repo => $enable_repo,
    version     => $version,
  }

  s3cmd::config { $owner:
    aws_access_key => $aws_access_key,
    aws_secret_key => $aws_secret_key,
    gpg_passphrase => $gpg_passphrase,
    require        => Class['s3cmd::install'],
  }
}

class s3cmd::config(
  $aws_access_key,
  $aws_secret_key,
  $gpg_passphrase,
  $owner,
) {
  $homedir = $owner ? {
    root    => '/root',
    default => "/home/${owner}",
  }

  file{"${homedir}/.s3cfg":
    owner   => $owner,
    mode    => '0400',
    content => template("${module_name}/s3cfg.erb"),
  }

}

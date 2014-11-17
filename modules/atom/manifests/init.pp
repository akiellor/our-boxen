class atom {
  package { 'Atom':
    ensure   => installed,
    source   => 'https://atom.io/download/mac',
    provider => compressed_app,
    flavor   => 'zip',
  }

  file { "${boxen::config::bindir}/apm":
    ensure  => link,
    target  => '/Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm',
    mode    => '0755',
    require => Package['Atom']
  }

  file { "${boxen::config::bindir}/atom":
    ensure  => link,
    target  => '/Applications/Atom.app/Contents/Resources/app/atom.sh',
    mode    => '0755',
    require => Package['Atom']
  }
}

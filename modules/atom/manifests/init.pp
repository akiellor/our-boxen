class atom {
  package { 'atom':
    ensure   => installed,
    source   => 'https://atom.io/download/mac',
    provider => compressed_app,
    flavor   => 'zip',
  }
}

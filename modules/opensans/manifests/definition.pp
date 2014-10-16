define opensans::definition {
  $fonts="/Users/${::luser}/Library/Fonts"
  $location='opensans'
  $prefix='OpenSans'

  file { "${prefix}-${title}.ttf":
    ensure => 'present',
    path   => "${fonts}/${prefix}-${title}.ttf",
    source => "puppet:///modules/${location}/${prefix}-${title}.ttf"
  }
}

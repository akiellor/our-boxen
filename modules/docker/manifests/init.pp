class docker {
  include boxen::config

  package { 'docker-pkg-1.5.0':
    ensure => installed,
    provider => 'pkgdmg',
    source => 'https://github.com/boot2docker/osx-installer/releases/download/v1.5.0/Boot2Docker-1.5.0.pkg',
  }

  boxen::env_script { 'docker-host':
    content => 'export DOCKER_HOST=tcp://localhost:2375',
  }
}

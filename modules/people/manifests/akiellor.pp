class people::akiellor {
  git::config::global { 'user.name':
    value  => 'Andrew Kiellor'
  }

  git::config::global { 'user.email':
    value  => 'akiellor@gmail.com'
  }

  class { 'osx::dock::position':
    position => 'right'
  }
}

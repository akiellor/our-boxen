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

  class { 'osx::global::key_repeat_rate':
    rate => 0
  }

  class { 'osx::global::key_repeat_delay':
    delay => 0
  }

  include osx::keyboard::capslock_to_control

  repository { "/Users/${::boxen_user}/src/restaurant-roulette":
    source   => 'charltonaustin/restaurant-roulette',
    provider => 'git';
  }
}

class people::akiellor {
  git::config::global { 'user.name':
    value  => 'Andrew Kiellor'
  }

  git::config::global { 'user.email':
    value  => 'akiellor@gmail.com'
  }

  git::config::global { 'push.default':
    value => 'matching',
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

  file { ["/Users/${::boxen_user}/.vim",
          "/Users/${::boxen_user}/.vim/bundle"]:
    ensure => directory,
  }

  file { "/Users/${::boxen_user}/.vimrc":
    content => "runtime bundle/vim-pathogen/autoload/pathogen.vim\nexecute pathogen#infect()\nsyntax on\nfiletype plugin indent on\nlet g:solarized_termcolors=256\nset background=light\ncolorscheme solarized\nset noswapfile",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-pathogen":
    source   => 'tpope/vim-pathogen',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-colors-solarized":
    source   => 'altercation/vim-colors-solarized',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-puppet":
    source   => 'rodjek/vim-puppet',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-fireplace":
    source   => 'tpope/vim-fireplace',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-clojure-static":
    source   => 'guns/vim-clojure-static',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/rainbow_parenthesis.vim":
    source   => 'kien/rainbow_parentheses.vim',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/nerdtree":
    source   => 'scrooloose/nerdtree',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  include clojure

  boxen::env_script { 'serve-python':
    content => "alias serve=\"python -m SimpleHTTPServer\""
  }

  include iterm2::stable
  include iterm2::colors::solarized_dark

  package { ['testdisk', 'watch']:
  }

  include python

  python::pip {'awscli':
    virtualenv => $python::config::global_venv
  }
}

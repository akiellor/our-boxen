class people::akiellor {
  git::config::global { 'user.name':
    value  => 'Andrew Kiellor'
  }

  git::config::global { 'user.email':
    value  => 'akiellor@gmail.com'
  }

  git::config::global { 'push.default':
    value => 'simple',
  }

  git::config::global { 'alias.st': value => 'status' }
  git::config::global { 'alias.purr': value => 'pull --rebase' }
  git::config::global { 'alias.df': value => 'diff' }
  git::config::global { 'alias.dc': value => 'diff --staged' }

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
    source => "puppet:///modules/people/${::boxen_user}.vimrc",
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-pathogen":
    source   => 'tpope/vim-pathogen',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-javascript":
    source   => 'pangloss/vim-javascript',
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

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-coffee-script":
    source   => 'kchmck/vim-coffee-script',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/ctrlp.vim":
    source   => 'kien/ctrlp.vim',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-go":
    source   => 'fatih/vim-go',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"],
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/tagbar":
    source   => 'majutsushi/tagbar',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"],
  }

  repository { "/Users/${::boxen_user}/.vim/bundle/vim-mustache-handlebars":
    source   => 'mustache/vim-mustache-handlebars',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"],
  }

  package { 'ctags':}

  include clojure

  boxen::env_script { 'serve-python':
    content => "alias serve=\"python -m SimpleHTTPServer\"",
  }

  boxen::env_script { 'editor':
    content => "export EDITOR=vim",
  }

  boxen::env_script { 'gopath':
    content => "export GOPATH=/Users/${::boxen_user}\nexport PATH=\$PATH:/Users/${::boxen_user}/bin",
  }

  include iterm2::stable
  include iterm2::colors::solarized_dark

  package { ['testdisk', 'watch', 'bazaar', 'ansible', 'tmux', 'heroku-toolbelt', 'phantomjs', 'maven31', 'slimerjs', 'gpg', 'tree', 'wget', 'imagemagick', 'jq']:
  }

  include python

  python::pip {'awscli':
    virtualenv => $python::config::global_venv
  }

  python::pip {'tmuxp':
    virtualenv => $python::config::global_venv
  }

  python::pip {'jrnl':
    virtualenv => $python::config::global_venv
  }

  python::pip {'fig':
    virtualenv => $python::config::global_venv
  }

  repository { "/Users/${::boxen_user}/src/akiellor.github.io":
    source   => 'akiellor/akiellor.github.io',
    provider => 'git';
  }

  repository { "/Users/${::boxen_user}/src/cd-office-hours":
    source   => 'maxamg/cd-office-hours',
    provider => 'git',
  }

  package { ["docker", "boot2docker"]:
    ensure => absent,
  }

  include docker

  include minecraft

  class { 'intellij':
    edition => 'community',
    version => '14.1.3',
  }

  boxen::osx_defaults { 'Make function keys do real things, and not apple things':
    user   => $::boxen_user,
    key    => 'com.apple.keyboard.fnState',
    domain => 'NSGlobalDomain',
    value  => 'true',
  }

  boxen::osx_defaults { 'Make tab key do real things, and not apple things':
    user   => $::boxen_user,
    key => 'AppleKeyboardUIMode',
    domain => 'NSGlobalDomain',
    value => '2',
  }

  include skype

  include go

  exec { "nuke-wfarr-chgo":
    provider => shell,
    command  => "rm -rf ${boxen::config::home}/chgo",
    onlyif   => "[[ -s ${boxen::config::home}/chgo ]] && cd ${boxen::config::home}/chgo && git remote -v | grep wfarr",
    before   => Repository[$go::chgo_root],
  }

  go::version { '1.1.1': }
  go::version { '1.1.2': }
  go::version { '1.4': }

  package { 'mercurial':
  }

  include mou
  include mou::themes
  include atom
  atom::package { 'language-puppet': }

  include projects::openwireless
  package { ['ncmpc', 'tig', 'colordiff', 'bash-completion', 'ranger']: }

  boxen::env_script { 'bash-completion':
    content => "[ -f $::homebrew::config::installdir/etc/bash_completion ] && . $::homebrew::config::installdir/etc/bash_completion",
  }

  repository { "/Users/${::boxen_user}/src/gocd":
    source   => 'akiellor/gocd',
    provider => 'git';
  }

  package { 'Safe':
    provider => 'compressed_app',
    source   => 'https://github.com/safeapp/safe/releases/download/VERSION-1.4/Safe-1.4-MacOSX.zip',
  }

  include adium

  package { 'task': }
  package { 'unrar': }
  package { 'cloc': }

  include hipchat

  include brewcask

  boxen::env_script { 'java-home':
    content => "export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home",
  }

  include postgresql

  postgresql::db { 'todo-backend': }

  postgresql::db { 'todo-backend-express-csp': }

  homebrew::tap { 'homebrew/science': }

  package { 'r': }

  vagrant::plugin { 'vagrant-berkshelf':
    version => '4.0.4'
  }
}

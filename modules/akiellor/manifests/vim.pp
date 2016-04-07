class akiellor::vim {
  file { ["/Users/${::boxen_user}/.vim",
          "/Users/${::boxen_user}/.vim/bundle"]:
    ensure => directory,
  }

  file { "/Users/${::boxen_user}/.vimrc":
    source => "puppet:///modules/akiellor/vimrc",
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

  repository { "/Users/${::boxen_user}/.vim/bundle/ag":
    source   => 'rking/ag.vim',
    provider => 'git',
    require  => File["/Users/${::boxen_user}/.vim/bundle"]
  }
}

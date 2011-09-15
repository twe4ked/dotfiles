## Installation

    cd ~/ # cd to your home directory
    git clone http://github.com/twe4ked/dotfiles.git .dotfiles # Clone the dotfiles.
    cd ~/.dofiles # cd to the .dotfile directory
    rake # Setup symlinks (do this from the .dotfiles directory)

## Basic features

* Custom functions
* Bash and zsh compatible
* Great looking and very helpful prompt

### Config

This file loads the rest of the config and also acts as a place to put major items.

* Search /Sites folder on `cd` command
* Set TextMate as default editor
* Make git colourful
* Sets title of window to be user@host
* .irbrc to make irb awesome (view framework/syntax highlighting/tab-completions/pretty-print/auto tab indentation).
* Prints current shell

## Prompt

What you have to look at all day.

### Features

* Git status/stashes/current branch
* RVM info
* Time
* Custom current working directory shortener [@bjeanes](http://github.com/bjeanes/dot-files)
* Only show user@hostname when needed
* Battery level indicator

#### Zsh

`~/.dotfiles » user@hostname` (zsh) `rvm ± master* 1+`

1+ is the number of git stashes
user@hostname only displays when user = root or connected over ssh

#### Bash

`~/.dotfiles (git-branch) user@hostname »` (bash)

## Other interesting things

#### Common aliases (open/edit)

`m path/to/project`

If no arguments are supplied open the current folder with TextMate.

`o path/to/project`

Use `o` instead of `open` (o ~/Sites will open the sites folder), if no arguments are supplied open the current folder.

#### Restart Passenger or Pow server

`rp` looks for a tmp directory, if there is no tmp directory it prompts you to create one, once it finds a tmp directory it touches tmp/restart.txt to tell passenger or pow to restart.

#### Notes

If you add a `.notes` file to any directory, the contents of that file will be output when you cd into the directory.

### Supported

* [HIRB](http://github.com/cldwalker/hirb) - A mini view framework for console/irb. Console goodies include a no-wrap table, auto-pager, tree and menu.
* [Wirble](http://rubygems.org/gems/wirble) - IRB syntax highlighting

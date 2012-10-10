require 'rake'

task :default => :install

desc "Install the dotfiles into user's home directory"
task :install do
  replace_all = false
  dotfiles    = File.dirname(__FILE__)
  files       = %w[zsh/zshrc
                   zsh/comp.d/ZLE
                   bash/bashrc
                   lib/ackrc
                   lib/gemrc
                   lib/irbrc
                   lib/pryrc
                   lib/inputrc
                   lib/tmux.conf
                   lib/freshrc
                   vim/gvimrc
                   vim/vimrc]

  files = Hash[files.zip(Array.new(files.size, "~/."))]
  files['vim/colors/'] = '~/.vim/'

  files.each do |file, destination|
    file_name        = file.split(/\//).last
    source_file      = File.join(dotfiles, file)
    destination_file = File.expand_path("#{destination}#{file_name}")

    def color(text, options = {})
      case options[:color]
      when :red
        text = "\033[31m#{text}\033[0m"
      when :green
        text = "\033[32m#{text}\033[0m"
      when :blue
        text = "\033[34m#{text}\033[0m"
      end
      text
    end

    if File.exist?(destination_file) || File.symlink?(destination_file)
      if replace_all
        replace_file(destination_file, source_file)
      else
        print color('overwrite ', :color => :red) + "#{destination_file}? [ynaq] "
        case $stdin.gets.chomp.downcase
        when 'a'
          replace_all = true
          replace_file(destination_file, source_file)
        when 'y'
          replace_file(destination_file, source_file)
        when 'q'
          exit
        else
          puts color('skipping ', :color => :blue) + destination_file
        end
      end
    else
      link_file(destination_file, source_file)
    end
  end
end

def replace_file(old_file, new_file)
  system %Q{rm "#{old_file}"}
  link_file(old_file, new_file)
end

def link_file(old_file, new_file)
  puts color('linking ', :color => :green) + new_file + ' -> ' + old_file
  system %Q{ln -fs "#{new_file}" "#{old_file}"}
end

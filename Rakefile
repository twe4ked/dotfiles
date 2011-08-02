require 'rake'

task :default => :install

desc "Install the dotfiles into user's home directory"
task :install do
  dotfiles  = File.dirname(__FILE__)
  files     = %w(zsh/zshrc
                 bash/bashrc
                 lib/ackrc
                 lib/gemrc
                 lib/irbrc
                 vim
                 vim/gvimrc
                 vim/vimrc)

  files = Hash[files.zip(Array.new(files.size, "~/"))]
  # files['lib/global.gems'] = '~/.rvm/gemsets/'

  files.each do |file, destination|
    file_name        = file.split(/\//).last
    source_file      = File.join(dotfiles, file)
    destination_file = File.expand_path(File.join(destination, ".#{file_name}"))

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
      if File.exist?("#{destination_file}.bak") || File.symlink?("#{destination_file}.bak")
        puts color('Backup files already exist. Aborting.', :color => :red)
        exit 1
      else
        puts color("The file .#{file_name} exists. Moving to .#{file_name}.bak", :color => :blue)
        system %Q{mv "#{destination_file}" "#{destination_file}.bak"}
      end
    end

    link_file(destination_file, source_file)
  end
end

def link_file(old_file, new_file)
  puts "Linked from " + color("#{new_file}", :color => :green) + " -> " + color("#{old_file}", :color => :green)
  system %Q{ln -fs "#{new_file}" "#{old_file}"}
end

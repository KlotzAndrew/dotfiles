require 'rake'

desc 'install dot files into home directory'
task :install do
  replace_all = false

  Dir['home_files/*'].each do |filename|
    file = File.basename(filename)

    if file_exists?(file)
      if file_identical?(file)
        puts "identical ~/.#{file}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  delete_file(file)
  link_file(file)
end

def delete_file(file)
  File.delete(File.join(ENV['HOME'], ".#{file}"))
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %(ln -s "$PWD/home_files/#{file}" "$HOME/.#{file}")
end

def file_exists?(file)
  File.exist?(File.join(ENV['HOME'], ".#{file}"))
end

def file_identical?(file)
  File.identical?(
    File.join(Dir.pwd, "home_files/#{file}"),
    File.join(ENV['HOME'], ".#{file}")
  )
end

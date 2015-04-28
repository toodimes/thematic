require 'fileutils'

namespace :thematic do
  desc "descriptions of the task" 
  task :install, [:filepath] do |task, args|
    # args[:filepath] represent the path of the theme

    puts "Inspecting theme..."

    puts "Installing CSS..."

    # it is assumed that the theme comes with a folder called 'css'
    copy_from_path = "#{args[:filepath]}/css"
    theme_subfolder = "theme"

    FileUtils.mkdir "vendor/assets/stylesheets/#{theme_subfolder}"

    Dir.open(copy_from_path).each do |filename|
      copy("#{copy_from_path}/#{filename}", "vendor/assets/stylesheets/#{theme_subfolder}/") unless File.directory?("#{copy_from_path}/#{filename}")
    end

    puts "Installing JS..."

    # it is assumed that the theme comes with a folder called 'js'
    copy_from_path = "#{args[:filepath]}/js"

    FileUtils.mkdir "vendor/assets/javascripts/#{theme_subfolder}"

    Dir.open(copy_from_path).each do |filename|
      copy("#{copy_from_path}/#{filename}", "vendor/assets/javascripts/#{theme_subfolder}/") unless File.directory?("#{copy_from_path}/#{filename}")
    end

  end 
end
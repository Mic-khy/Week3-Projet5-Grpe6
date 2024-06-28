
require 'fileutils'

if ARGV.length != 1
  puts "Usage: mkdiruby <project_name>"
  exit
end

project_name = ARGV[0]

# Crée le dossier du projet
FileUtils.mkdir_p(project_name)


Dir.chdir(project_name) do
  # Crée le Gemfile
  File.open('Gemfile', 'w') do |file|
    file.puts <<~GEMFILE
      source 'https://rubygems.org'
      gem 'rspec'
      gem 'dotenv'
    GEMFILE
  end

  # Initialise un dépôt Git
  system('git init')

  # Crée le fichier .env
  FileUtils.touch('.env')

  # Ajoute .env au .gitignore
  File.open('.gitignore', 'a') do |file|
    file.puts '.env'
  end

  # Crée le dossier lib
  FileUtils.mkdir_p('lib')

  # Initialise RSpec
  system('rspec --init')

  # Crée le fichier README.md
  File.open('README.md', 'w') do |file|
    file.puts "# #{project_name.capitalize}\n\nThis is a Ruby project."
  end
end

puts "Ruby project '#{project_name}' has been created successfully."

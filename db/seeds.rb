#frozen_string_literal: true

require 'yaml'

puts 'Generating seeds...'

file = Rails.root.join('db', 'projects.yml')
projects = YAML.safe_load(File.read(file))
projects.each { |project| Project.create! project }

puts 'All done!'

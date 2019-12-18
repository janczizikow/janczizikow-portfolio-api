# frozen_string_literal: true

require 'yaml'

puts 'Generating seeds...'

if Project.count < 1
  puts 'Generating projects...'
  projects_file = Rails.root.join('db', 'projects.yml')
  projects = YAML.safe_load(File.read(projects_file))
  projects.reverse.each { |project| Project.create! project }
  puts 'Projects generated!'

  puts 'Generating projects photos...'

  photos_file = Rails.root.join('db', 'photos.yml')
  photos = YAML.safe_load(File.read(photos_file))
  photos.each do |photo|
    project = Project.find_by(name: photo['name'])
    photo['photos']&.each { |url| Photo.create!(project: project, remote_photo_url: url)}
  end

  puts 'Photos generated!'
end

puts 'All done!'

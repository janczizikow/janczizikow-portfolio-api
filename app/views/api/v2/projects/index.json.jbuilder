json.array! @projects do |project|
  json.merge! project.attributes
  json.extract! project, :thumbnail, :photos, :next, :prev
end

class AddThumbnailToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :thumbnail, :string
  end
end
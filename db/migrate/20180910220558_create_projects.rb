class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.date :date
      t.string :slug, null: false
      t.string :category
      t.text :description
      t.text :links

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end

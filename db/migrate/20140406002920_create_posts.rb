class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.float :longitude
      t.float :latitude
      t.datetime :time_posted
      t.text :markdown
      t.boolean :is_public, :default => false
      t.timestamps
    end
  end
end

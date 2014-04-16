class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :photo
      t.integer :post_id
      t.timestamps
    end
  end
end

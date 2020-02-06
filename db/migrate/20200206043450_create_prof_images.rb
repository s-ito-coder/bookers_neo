class CreateProfImages < ActiveRecord::Migration[5.2]
  def change
    create_table :prof_images do |t|
      t.integer :profile_image_id
      t.integer :image_id

      t.timestamps
    end
  end
end

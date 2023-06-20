class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :url
      t.string :caption
      t.integer :article_id

      t.timestamps
    end
  end
end

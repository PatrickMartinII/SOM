class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :image_url
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end

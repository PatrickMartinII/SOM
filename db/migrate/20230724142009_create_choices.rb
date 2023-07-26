class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string :content
      t.references :question, null: false, foreign_key: true
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end

class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.references :book, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.text :bio

      t.timestamps
    end
  end
end

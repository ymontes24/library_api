class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.date :published_date
      t.string :isbn
      t.references :author, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
    
    add_index :books, :isbn, unique: true
  end
end
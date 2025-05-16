class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :book, null: false, foreign_key: { on_delete: :cascade }
      t.date :checkout_date, null: false
      t.date :return_date
      t.boolean :returned, default: false

      t.timestamps
    end
  end
end

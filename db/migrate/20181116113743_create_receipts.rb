class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.float :amount
      t.references :user_file, foreign_key: true

      t.timestamps
    end
  end
end

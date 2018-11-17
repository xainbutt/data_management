class CreateUserFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_files do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :program
      t.float :fee
      t.float :discount
      t.string :ssn
      t.string :payment_status
      t.datetime :placement_date
      t.datetime :dob

      t.timestamps
    end
  end
end

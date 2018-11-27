class AddContactAndBalanceFieldsToUserFile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_files, :email, :string
    add_column :user_files, :phone_no, :string
    add_column :user_files, :balance, :float
    add_column :user_files, :due_date, :datetime
  end
end

class AddPaymentStatusColorToUserFile < ActiveRecord::Migration[5.2]
  def change
    add_column :user_files, :payment_status_color, :string
  end
end

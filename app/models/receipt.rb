class Receipt < ApplicationRecord
  belongs_to :user_file

  validates_presence_of :amount
  after_create :deduct_balance
  
  protected

  def deduct_balance
    puts "In deduct balance"
   
    puts "amount: #{self.inspect}"
    # self.user_file.balance = self.user_file.balance - self.amount
    self.user_file.update_attributes(balance: self.user_file.balance - self.amount)
    puts "balance: #{self.user_file.inspect}"
  end 
end

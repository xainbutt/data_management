require 'rails_helper'

RSpec.describe Receipt, type: :model do
    it { should validate_presence_of :amount}

    it 'should deduct amount from balance of userfile when receipt created' do 
        user_file = create(:user_file, fee: 100)
        receipt = create(:receipt, user_file_id: user_file.id)
        puts "userfile #{user_file.inspect}"
        puts "receipt  #{receipt.inspect}"
        expect(user_file.balance).to eq(user_file.fee - receipt.amount) 
    end
end

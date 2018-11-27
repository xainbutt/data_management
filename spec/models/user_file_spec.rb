require 'rails_helper'

RSpec.describe UserFile, type: :model do

  # subject {
  #   described_class.new(first_name: 'Zain', last_name: 'Butt', dob: Date.current,
  #     program: 'program', fee: 55, discount: 5, address: 'Address', placement_date: Date.current,
  #     payment_status: 'yellow', ssn: 'ssn'
  #   )
  # }

  it { should validate_presence_of :first_name}

  it { should validate_presence_of :last_name}

  it { should validate_presence_of :dob}

  it { should validate_presence_of :program}

  it { should validate_presence_of :fee}

  it { should validate_presence_of :discount}

  it { should validate_presence_of :ssn}

  it { should validate_presence_of :address}

  it { should validate_presence_of :placement_date}

  it { should validate_presence_of :email}

  it { should validate_presence_of :phone_no}

  it { should validate_presence_of :payment_status_color}

  # it { should define_enum_for(:payment_status_color).with({ yellow: 'IMMEDIATE F/UP', red:'NON-PAYMENT HOLDS', pink:'CLIENT HOLD REQUEST', purple:'CLOSED FILE' })}

  # it 'should populate payment status after selecting status color' do
  #   user_file = create(:user_file)
  #   expect(user_file.payment_status_color).to eq('yellow')
  #   expect(user_file.payment_status).to eq('IMMEDIATE F/UP')
  # end

  it { should have_many :notes }

  it { should have_many :receipts}

#   it should not accept color outside of defined enum



end
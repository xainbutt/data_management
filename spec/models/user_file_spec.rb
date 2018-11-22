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

  it { should validate_presence_of :payment_status}

  it { should validate_inclusion_of(:payment_status).in_array(%w(yellow red purple pink))}

  it { should have_many :notes }

  it { should have_many :receipts}

end
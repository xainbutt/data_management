class UserFile < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address, :ssn, :discount,
                        :placement_date, :payment_status, :dob, :fee, :program
  validates_inclusion_of :payment_status, in: %w(yellow red purple pink)
  has_many :notes
  has_many :receipts
  has_many_attached :files

  def full_name
    "#{first_name} #{last_name}"
  end

end

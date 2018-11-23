class UserFile < ApplicationRecord
  # validation
  validates_presence_of :first_name, :last_name, :address, :ssn, :discount,
                        :placement_date, :payment_status_color, :dob, :fee, :program
  validates_inclusion_of :payment_status_color, in: %w(yellow red purple pink)

  # callback
  before_save :add_payment_status, on: [:update, :create]

  # association
  has_many :notes, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many_attached :files

  # scopes
  default_scope { order('created_at desc')}
  scope :search, -> (attr, val){ where(" #{attr} ILIKE ?", "%#{val}%") }

  # payment status color enum to map with the payment status
  enum payment_status_color: { yellow: 'IMMEDIATE F/UP', red:'NON-PAYMENT HOLDS', pink:'CLIENT HOLD REQUEST', purple:'CLOSED FILE' }


  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def add_payment_status
    self.payment_status = UserFile.payment_status_colors[self.payment_status_color.to_sym]
  end

end

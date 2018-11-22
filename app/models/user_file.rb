class UserFile < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address, :ssn, :discount,
                        :placement_date, :payment_status_color, :dob, :fee, :program
  has_many :notes, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many_attached :files

  default_scope { order('created_at desc')}
  scope :search, -> (attr, val){ where(" #{attr} ILIKE ?", "%#{val}%") }
  # scope :program, -> (prog){ where('program is like %?%', prog) }
  # scope :payment_status, -> (ps){ where('payment_status = ?', ps) }
  # scope :full_name , -> (fname, lname){ where('first_name = %?% OR last_name = %?% ', fname, lname) }

  before_save :add_payment_status, on: [:update, :create]
  enum payment_status_color: { yellow: 'IMMEDIATE F/UP', red:'NON-PAYMENT HOLDS', pink:'CLIENT HOLD REQUEST', purple:'CLOSED FILE' }


  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def add_payment_status
    self.payment_status = UserFile.payment_status_colors[self.payment_status_color.to_sym]
  end

end

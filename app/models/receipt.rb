class Receipt < ApplicationRecord
  belongs_to :user_file

  validates_presence_of :amount
end

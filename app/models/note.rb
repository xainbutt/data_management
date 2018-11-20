class Note < ApplicationRecord
  belongs_to :user_file

  validates_presence_of :text
end

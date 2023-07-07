class Lecturer < ApplicationRecord
  belongs_to :user
  has_many :college_classes
end

class CollegeClass < ApplicationRecord
  belongs_to :lecturer
  belongs_to :course
  belongs_to :room
end

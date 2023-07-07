class Course < ApplicationRecord
  belongs_to :course_type
  has_many :college_classes
end

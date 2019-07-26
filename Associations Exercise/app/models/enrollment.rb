class Enrollment < ApplicationRecord
  belongs_to :course, 
    class_name: 'Course',
    foreign_key: :course_id,
    primary_key: :id

  belongs_to :user,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: 'User'
    
end

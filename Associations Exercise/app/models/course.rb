class Course < ApplicationRecord

  belongs_to :user,
    class_name: 'User',
    foreign_key: :instructor_id,
    primary_key: :id

  has_many :enrollments, 
    class_name: 'Enrollment',
    foreign_key: :course_id,
    primary_key: :id

  has_many :enrolled_students,
    through: :enrollments,
    source: :user
    
  has_many :prereqs,
    foreign_key: :id,
    primary_key: :prereq_id,
    class_name: 'Course'

end

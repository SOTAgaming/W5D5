class User < ApplicationRecord
  has_many :courses,
  class_name: 'Course',
  foreign_key: :instructor_id,
  primary_key: :id

  has_many :enrollments,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: 'Enrollment'

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course
end

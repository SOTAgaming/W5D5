class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

    has_many :shortened_urls,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :ShortenedUrl

    has_many :visit,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :Visit
end 
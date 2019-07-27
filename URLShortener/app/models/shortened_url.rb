class ShortenedUrl < ApplicationRecord

  def self.random_code
    SecureRandom.urlsafe_base64
  end

  def self.new_url(user, long_url)
    ShortenedUrl.create!(
      :short_url => ShortenedUrl.random_code,
      :long_url => long_url,
      :user_id => user.id
    )
  end

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit    

  def num_clicks
    self.visits.length
  end

  def num_uniques
    user_id = []
    count = 0
    self.visits.each do |visit|
      if !user_id.include?(visit.user_id)
        count += 1
        user_id << visit.user_id
      end
    end
    count
  end

  def num_recent_uniques
    query = <<-SQL
      SELECT COUNT(user_id)
      FROM visits
    SQL
    query
  end

end
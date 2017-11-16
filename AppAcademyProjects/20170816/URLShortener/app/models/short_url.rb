class ShortUrl < ApplicationRecord
  validates :long_url, :short_url, :submitter, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :submitter_id,
    primary_key: :id

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit,
    dependent: :destroy

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  def self.random
    loop do
      random = SecureRandom.urlsafe_base64(16)
      return random unless ShortUrl.exists?(short_url: random)
    end
  end

  def self.create_from_long!(user, long_url)
    ShortUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: ShortUrl.random
    )
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select('user_id').distinct.count
  end

  def num_recent_uniques
    visits
      .select('user_id')
      .where('created_at > ?', 10.minutes.ago)
      .distinct
      .count
  end
end

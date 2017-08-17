class ShortUrl < ApplicationRecord
  validates :long_url, :short_url, :submitter, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :submitter_id,
    primary_key: :id

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
end

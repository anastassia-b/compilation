class Visit < ApplicationRecord
  validates :visitor, :short_url, presence: true

  belongs_to :short_url

  belongs_to :visitor,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  def self.record_visit!(user, short_url)
    Visit.create!(user_id: user.id, short_url_id: short_url.id)
  end
end

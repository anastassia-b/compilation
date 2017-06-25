class Note < ApplicationRecord
  validates :content, :track, :user, presence: true

  belongs_to :user
  belongs_to :track
end

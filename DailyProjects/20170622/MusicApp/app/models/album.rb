class Album < ApplicationRecord
  validates :name, :band, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :name, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maximum: 9000 }

  has_many :tracks, dependent: :destroy
  belongs_to :band
end

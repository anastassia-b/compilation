class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many :submitted_urls,
    class_name: :ShortURL,
    foreign_key: :submitter_id,
    primary_key: :id
end

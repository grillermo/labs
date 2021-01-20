class Person < ApplicationRecord
  extend FriendlyId

  friendly_id :name

  has_many :nicknames, foreign_key: :people_id

  validates :name, presence: true, uniqueness: true
end

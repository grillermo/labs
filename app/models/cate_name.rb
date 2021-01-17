class CateName < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end

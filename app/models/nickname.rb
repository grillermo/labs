class Nickname < ApplicationRecord
  belongs_to :person, foreign_key: :people_id
end

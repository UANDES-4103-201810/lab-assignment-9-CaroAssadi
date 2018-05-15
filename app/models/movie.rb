class Movie < ApplicationRecord
  has_one :director
  has_one :address
  has_many :categories
  has_many :actors, through: :actor_movies
end

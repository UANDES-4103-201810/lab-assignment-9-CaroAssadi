class Movie < ApplicationRecord
  belongs_to :director
  has_one :address
  has_many :categories
  has_many :actors, through: :actor_movies
  accepts_nested_attributes_for :address
end

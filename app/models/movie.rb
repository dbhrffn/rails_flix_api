class Movie < ApplicationRecord
  include Media

  STATUSES = [
    "Rumored",
    "Planned",
    "In Production",
    "Post Production",
    "Released",
    "Canceled"
  ]

  has_and_belongs_to_many :genres, -> { alphabetical }, class_name: "Movie::Genre"

  validates :title, :status, presence: true
  validates :tmdb_id, uniqueness: { allow_blank: true }

  def self.full_text_search(query)
    where("MATCH(title, tagline, overview) AGAINST(? IN BOOLEAN MODE)", query)
  end

  def to_param
    [id, title.parameterize].join("-")
  end

  def posters
    images.where(category: 'poster')
  end

  def backdrops
    images.where(category: 'backdrop')
  end
end
  
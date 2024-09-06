class Person < ApplicationRecord
    has_many :credits
  
    scope :alphabetical, -> { order(name: :asc) }
  
    validates :name, presence: true
  
    enum gender: { "Not specified" => 0, "Female" => 1, "Male" => 2, "Non-Binary" => 3 }
  
    def initials
      name.split.map(&:first).join
    end
  
    def profile?
      profile_path.present?
    end
  
    def profile_url(version="original")
      tmdb_image(profile_path, version)
    end
  
    def self.lookup(tmdb_id, **attrs)
        find_or_create_by(tmdb_id: tmdb_id) do |person|
        person.attributes = attrs
      end
    end

    def self.full_text_search(query)
      where("MATCH(name) AGAINST(? IN BOOLEAN MODE)", query)
    end
  end
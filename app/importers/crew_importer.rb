class CrewImporter
    def initialize(base)
      @base = base
    end
  
    def import(tmdbs)
      tmdbs.each do |tmdb|
        person = Person.lookup(tmdb.id, name: tmdb.name, gender: tmdb.gender, profile_path: tmdb.profile_path)
        @base.crew_credits.create!(person: person, job: tmdb.job)
      end
    end
  end
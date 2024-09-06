class MoviesController < MediaController
    def index
      @movies = Movie.page(params[:page]).per(10)
      render json: {
        data: @movies,
        meta: {
          current_page: @movies.current_page,
          total_pages: @movies.total_pages,
          total_count: @movies.total_count
        }
      }
    end
  
    def trending_movies
      @movies = Movie.order(vote_average: :desc).limit(10)
      render json: { data: @movies.as_json() }
    end

    # GET /movies/:id
    def show
      @movie = Movie.find(params[:id])
  
      @credits = @movie.acting_credits

      person_ids = @credits.pluck(:person_id).uniq
      @people = Person.where(id: person_ids).index_by(&:id)
      
      @credits_with_people = @credits.map do |credit|
        {
          credit: credit,
          person: @people[credit.person_id]
        }
      end
      
      @videos = @movie.videos
      @posters = @movie.images.posters
      @backdrops = @movie.images.backdrops
      
      render json: {
        movie: @movie,
        credits: @credits_with_people,
        videos: @videos,
        posters: @posters,
        backdrops: @backdrops
      }
    end

    def search
      @movies = Movie.full_text_search(params[:query])
      render json: @movies
    end
  end
  
class TvShowsController < MediaController
    def index
        @tv_shows = TvShow.page(params[:page]).per(10)
        render json: {
          data: @tv_shows,
          meta: {
            current_page: @tv_shows.current_page,
            total_pages: @tv_shows.total_pages,
            total_count: @tv_shows.total_count
          }
        }
      end

    def trending_tv_shows
      @tv_shows = TvShow.order(vote_average: :desc).limit(10)
      render json: { data: @tv_shows.as_json() }
    end

    def show
      @tv_show = TvShow.find(params[:id])
  
      @credits = @tv_show.acting_credits

      person_ids = @credits.pluck(:person_id).uniq
      @people = Person.where(id: person_ids).index_by(&:id)
      
      @credits_with_people = @credits.map do |credit|
        {
          credit: credit,
          person: @people[credit.person_id]
        }
      end

      @seasons   = @tv_show.seasons
      @videos    = @tv_show.videos
      @posters   = @tv_show.images.posters
      @backdrops = @tv_show.images.backdrops

      render json: {
        tv_show: @tv_show,
        credits: @credits_with_people,
        seasons: @seasons,
        videos: @videos,
        posters: @posters,
        backdrops: @backdrops,
      }
    end

    def search
      @tv_shows = TvShow.full_text_search(params[:query])
      render json: @tv_shows
    end
end

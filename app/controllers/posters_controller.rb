class PostersController < ApplicationController
    def index
    @posters = (Movie.posters + TvShow.posters).shuffle.first(200)
    render json: {
        data: @posters,
    }
    end
end

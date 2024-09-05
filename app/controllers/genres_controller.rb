class GenresController < ApplicationController
    def index
        @genres = Genre.page(params[:page]).per(12)
        render json: {
          data: @genres,
          meta: {
            current_page: @genres.current_page,
            total_pages: @genres.total_pages,
            total_count: @genres.total_count
          }
        }
    end
end

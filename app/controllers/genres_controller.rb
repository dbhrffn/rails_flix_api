class GenresController < ApplicationController
    # Skip CSRF verification for API requests
    skip_before_action :verify_authenticity_token, only: [:update]

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

    def show
      @genre = Genre.find(params[:id])
      render json: @genre
    end

    def create
      @genre = Genre.new(post_params)
      if @genre.save
        render json: @genre, status: :created
      else
        render json: @genre.errors, status: :unprocessable_entity
      end
    end

    def update
      @genre = Genre.find(params[:id])
      if @genre.update(genre_params)
        render json: @genre
      else
        render json: @genre.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy
      head :no_content
    end

    private

    def genre_params
      params.require(:genre).permit(:name)
    end
end

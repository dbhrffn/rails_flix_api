class PeopleController < ApplicationController
    def index
        @people = Person.order(:name).page(params[:page]).per(10)
        render json: {
          data: @people,
          meta: {
            current_page: @people.current_page,
            total_pages: @people.total_pages,
            total_count: @people.total_count
          }
        }
    end
end

class SessionsController < ApplicationController
      # Skip CSRF protection for API requests
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

    def create
      admin = Administrator.find_by(email: params[:email])
      
      if admin&.authenticate(params[:password])
        token = JWT.encode({ admin_id: admin.id }, '051aa2c3a14fb59b4f203af25932d2198bb1f7a01e0964d04cb8e79fe946232aa37e6e2e416caff66c737319ad018d31e7abf989aafb77222c250022436981dd', 'HS256')
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  
    def destroy
      # For logout, you might handle token invalidation or just handle it client-side
      head :no_content
    end
  end
  
class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  rescue_from JWT::DecodeError, with: :unauthorized

  #add authentication
  def authentication_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    begin
        @decoded = JsonWebToken.decode(token)
        @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :unauthorized
    rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def unauthorized(exception)
    render json: { error: exception.message }, status: :unauthorized
  end
end

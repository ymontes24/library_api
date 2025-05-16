class Api::V1::AuthenticationController < ApplicationController
  # POST /api/v1/login
  def login
    @user = User.find_by(email: login_params[:email])
    
    if @user&.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%Y-%m-%d %H:%M"), user: UserSerializer.new(@user) }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:auth).permit(:email, :password)
  end
end 
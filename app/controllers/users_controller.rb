class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register create]
  wrap_parameters :user, include: [:name, :email, :password, :password_confirmation]

  def login
    authenticate params[:email], params[:password]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      response = { message: 'User created successfully'}
      render json: response, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: {
        access_token: command.result,
        message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

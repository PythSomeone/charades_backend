
  class UserController < ApplicationController

    private def user_params
      params.permit(:username, :password,)
    end

    def index
      @user = User.order('username')
      render json: {status: 'Succes', message: 'loaded all users', data: @user}, status: :ok
    end

    def show
      user = User.find(params[:id])
      render json: {status: 'Succes', message: 'loaded user', data: user}, status: :ok
    end

    def create
      user = User.new(user_params)

      if user.save
        render json: {status: 'Succes', message: 'saved user', data: user}, status: :ok
      else
        render json: {status: 'Error', message: 'failed to save user', data: user}, status: :unprocessable_entity
      end
    end

    def update
      @user = User.find(params[:id])
      user.update_attributes(user_params)
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      render json: {status: 'Succes', message: 'deleted user', data: user}, status: :ok
    end

    private
    def word_params
      params.permit(:email, :username)
    end

  end

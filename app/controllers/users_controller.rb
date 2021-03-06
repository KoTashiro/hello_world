class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
        redirect_to '/login', success: '登録が完了しました'
    else
        flash.now[:danger] = '登録に失敗しました'
        render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザ情報を更新しました。"
      redirect_to '/pages'
    else
      flash.now[:danger] = "ユーザ情報の更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.posts.each { |post| post.delete_with_image }
    user.destroy
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
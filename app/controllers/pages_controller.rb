class PagesController < ApplicationController

  PER = 5

  def index
    # URLを直打ちされた場合はログイン画面に戻す
    if current_user == nil
      flash[:danger] = 'ログインが必要です'
      redirect_to '/login'
    end
    if params[:query].present?
      @posts = Post.where('title LIKE ?', "%#{params[:query]}%")
        .or(Post.where('description LIKE ?', "%#{params[:query]}%"))
        .page(params[:page]).per(PER)
    else
      @posts = Post.where(user: current_user).page(params[:page]).per(PER)
    end
  end
end


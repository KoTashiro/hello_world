require 'fileutils'

class PostsController < ApplicationController
  before_action :require_login


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to '/pages', success: '投稿しました。'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to '/pages'
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    Dir.rmdir("#{Rails.root.to_s}/public/uploads/post/image/#{post.id}")
    flash.now[:danger] = "投稿を削除しました。"
    redirect_to '/pages'
  end

  private

  def post_params
    params.require(:post).permit(:child_name, :ruby_name,:need_ruby, :need_space, :thread_color, :font_name)
  end

  def require_login
    redirect_to '/' if current_user.blank?
  end

end

class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy, :update, :edit]

  def index
    @post = Post.all
  end

  def edit
  end

  def show
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "投稿は更新されました"
    else
      render :edit
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿されました"
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: "投稿を削除しました"
    else
      redirect_to root_path, alert: "投稿を削除できませんでした"
    end
  end

  private
  
  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text, :title)
  end
end

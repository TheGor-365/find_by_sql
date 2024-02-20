class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save ? (redirect_to comment_url(@comment)) : (render :new)
  end

  def update
    @comment.update(comment_params) ? (redirect_to comment_url(@comment)) : (render :edit)
  end

  def destroy
    @comment.destroy
    redirect_to comments_url
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:post_id, :content)
  end
end

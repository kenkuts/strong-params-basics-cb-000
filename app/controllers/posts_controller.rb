class PostsController < ApplicationController
	before_action :set_post, only: %i[ show edit update ]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params.require(:post).permit(:title, :description))
	  redirect_to post_path(@post)
	end

	def update
		@post.update(params.require(:post).permit(:title, :description))
	  redirect_to post_path(@post)
	end

	def edit
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

end

class PostsController < ApplicationController
	before_action :set_post, only: %i[ show edit update ]
	before_action :post_params, only: %i[ create update ]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params(:title, :description))
	  redirect_to post_path(@post)
	end

	def update
		@post.update(post_params(post_params(:title, :description)))
	  redirect_to post_path(@post)
	end

	def edit
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params(*args)
		params.require(:post).permit(*args)
	end

end

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.sort_by{|post| post.votes.sum(:value)}.reverse
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = @current_user
    if @post.save
      flash[:success] = "Submission completed on <%= post.created_at.strftime(%b %d, %Y at %I:%Mp ) %>."
      redirect_to root_path
    else
      render "new"
  end

end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    if @post.update(link_params)
      redirect_to root_url
    else
      render "edit"
    end
  end


    def click
      @post = Post.find(params[:id])
      @post.votes.create
      redirect_to @link_url
    end



  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :url)
    end

end

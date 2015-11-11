class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]


  def create
    @post = Post.find(params[:link_id])
    if params[:downvote]
      @post.votes.create(value: -1)
    else
      @post.votes.create
    end
    redirect_to root_url
  end
  
end

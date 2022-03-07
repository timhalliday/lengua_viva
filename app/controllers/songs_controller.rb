class SongsController < ApplicationController
  def show
    @resource_show_page = true
    @comment = Comment.new
    @review = Review.new
    @resource = Resource.find(params[:id])
    View.create(user: current_user, resource: @resource)
    @like = Like.find_by(user: current_user, resource: @resource)
    @bookmark = Bookmark.find_by(user: current_user, resource: @resource)
  end
end

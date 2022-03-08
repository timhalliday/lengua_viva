class VideosController < ApplicationController
  def show
    @word = Word.new
    @resource_show_page = true
    @comment = Comment.new
    @review = Review.new
    @resource = Resource.find(params[:id])
    View.create(user: current_user, resource: @resource)
    @related_resources = @resource.find_related_tags
    @like = Like.find_by(user: current_user, resource: @resource)
    @bookmark = Bookmark.find_by(user: current_user, resource: @resource)
  end
end

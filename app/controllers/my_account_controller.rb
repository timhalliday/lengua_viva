class MyAccountController < ApplicationController
  def show
    @user = current_user
    @bookmarked = @user.bookmarks.map { |bookmark| bookmark.resource }
    @bookmarked = @bookmarked.reverse
    @viewed = @user.views.map { |view| view.resource }
    @viewed = @viewed.reverse.uniq

    @tags = ActsAsTaggableOn::Tag.all
  end
end

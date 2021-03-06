class Resource < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, :type, :author, :url, presence: true
  acts_as_taggable_on :tags

  include PgSearch::Model
  pg_search_scope :search_by_title_author_source_and_type,
    against: [ :title, :author, :source, :type ],
    using: {
      tsearch: { prefix: true }
    }

  def to_show_path
    "#{type.downcase.pluralize}/show"
  end

  def liked?(user)
    likes.find { |like| like.user == user }
  end

  def bookmarked?(user)
    bookmarks.find { |bookmark| bookmark.user == user }
  end

  def get_user_review(user)
    reviews.find { |review| review.user == user }
  end

end

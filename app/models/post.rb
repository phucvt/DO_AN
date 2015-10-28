# post
class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :location
  has_many :likes
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 10, maximum: 30 }
  validates :area, presence: true
  validates :price, presence: true
  validates :address, presence: true, length: { minimum: 5 }
  validates :desc, presence: true, length: { maximum: 1000 }
  validate :picture_size

  def self.list_categories
    Category.all
  end

  def self.search(search, min_price, max_price)
    @posts = Post.all
    search = '' if search.nil?
    min_price = 0 if min_price.nil?
    max_price = 1_000_000_000_000 if max_price.nil?
    @posts = @posts.where(['title LIKE ?', "%#{search}%"])
    @posts = @posts.where(['price <= ?', max_price])
    @posts = @posts.where(['price >= ?', min_price])
  end

  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  private

  def picture_size
    return unless picture.size > 5.megabytes
    errors.add(:picture, 'should be less than 5MB')
  end
end

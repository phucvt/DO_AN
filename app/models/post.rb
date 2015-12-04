# post
class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
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

  scope :approved, -> {
    where(:approve => true )
  }
  scope :pending, -> {
    where(:approve => false )
  }
  def self.list_categories
    Category.all
  end

  def Post.search(category_id="", location_id="",search="", min_price="", max_price="")
    @posts = Post.all
    @posts = @posts.where(['category_id = ?', category_id]) if category_id!=""
    @posts = @posts.where(['location_id = ?', location_id]) if location_id!=""
    @posts = @posts.where(['title LIKE ?', "%#{search}%"]) if search != ""
    @posts = @posts.where(['price >= ?', min_price]) if min_price != ""
    @posts = @posts.where(['price <= ?', max_price]) if max_price != ""
    return @posts
  end

  def Post.covertpending
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

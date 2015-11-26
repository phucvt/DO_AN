# PostsHelper
module PostsHelper
  def approve?
    @posts.each do |post|
      post.approve == 1
    end
  end
end

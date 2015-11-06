class ReviewsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if logged_in?
      @review = @post.reviews.create(user_id: current_user.id, review: review_params[:review])
      redirect_to :back
    else
      flash[:danger] = 'Vui long dang nhap'
      redirect_to login_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :review)
  end
end

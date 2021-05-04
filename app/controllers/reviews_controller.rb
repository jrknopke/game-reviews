class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to reviews_path
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:title, :content)
    end
end

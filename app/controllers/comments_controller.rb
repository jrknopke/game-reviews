class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comment, only: [:show, :edit, :update]

    def index
        if params[:review_id] && @review = Review.find_by_id(params[:review_id])
            @comments = @review.comments
        else
            @error = "That review doesn't exist" if parmas[:review_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:review_id] && @review = Review.find_by_id(params[:review_id])
            @comment = @review.comments.build
        else
            @error = "That review doesn't exist" if params[:review_id]
            @comment = Comment.new
        end
    end

    def create
        @review = Review.find_by_id(params[:review_id])
        @comment = current_user.comments.build(comment_params)
        #binding.pry
        if @comment.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content,:review_id, :user_id)
    end
end

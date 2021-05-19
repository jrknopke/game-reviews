module ReviewsHelper
    def display_index_helper
        if @user
            content_tag(:h1, "#{@user.username}'s Reviews")
        else
            content_tag(:h1, "All Reviews")
        end
    end
end

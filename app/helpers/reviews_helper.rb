module ReviewsHelper
    def display_index_helper
        if @user
            content_tag(:h1, "#{@user.username}'s Posts")
        else
            content_tag(:h1, "All Posts")
        end
    end
end

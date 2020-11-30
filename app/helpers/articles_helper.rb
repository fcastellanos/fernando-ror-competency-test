module ArticlesHelper
    def format_user_name(user)
        user.first_name + " " + user.last_name.chars.first + "."
    end

    def action_allowed?(user, article)
        logged_in?(:editor) && article.user_id == user.id
    end
end

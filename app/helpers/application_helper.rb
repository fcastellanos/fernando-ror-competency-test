module ApplicationHelper
    def logged_in_name(user)
        user.first_name + " " + "(" + user.role.to_s + ")"
    end
end

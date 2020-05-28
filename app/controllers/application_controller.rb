class ApplicationController < ActionController::Base
before_action :current_user
helper_method :current_user

    def current_user
        @user = (Athlete.find_by(id: session[:athlete_id])) || (Coach.find_by(id: session[:coach_id]))
    end

    def logged_in
        current_user.id != nil
    end

    def require_login
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in
    end

end

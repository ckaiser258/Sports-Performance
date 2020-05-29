class ApplicationController < ActionController::Base
# before_action :fetch_user
before_action :current_user
helper_method :current_user, :logged_in?

    # def fetch_user     
    #   @logged_in = logged_in?
    #   if logged_in? 
    #     @user = User.find(current_user_id)  
    #   end
    # end 

    def current_user
        @user = (Athlete.find_by(id: session[:athlete_id])) || (Coach.find_by(id: session[:coach_id]))
    end

    def logged_in?
        !!current_user
        # byebug
    end

    def require_login
        return redirect_to(controller: 'sessions', action: 'new') unless logged_in
    end

end

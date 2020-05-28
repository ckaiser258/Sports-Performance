class SessionsController < ApplicationController
    def new
        @athlete = Athlete.find_by(params[:email])
    end

    def create
        if params[:session][:a_c] == 'coach'
            user = Coach.find_by(email: params[:email])
            user.try(:authenticate, params[:password])
        else
            user = Athlete.find_by(email: params[:email])
            user.try(:authenticate, params[:password])
        end

        return redirect_to(controller: 'sessions', action: 'new') unless user

        if params[:email]
            session[:coach_id] = user.id
            redirect_to coach_path #may need to edit to show THEIR athletes
        else
            session[:athlete_id] = athlete.id
            redirect_to coach_path #figure out how to change to their coach's path
        end
    end

    def destroy
        session.delete :athlete_id || :coach_id
        redirect_to '/'
    end

    private

    def athlete_params
        params.require(:session).permit(:email, :password)
    end
end
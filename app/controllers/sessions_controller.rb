class SessionsController < ApplicationController
    def new
        @athlete = Athlete.find_by(params[:email])
    end

    def create
        athlete = Athlete.find_by(name: athlete_params[:name])
        athlete = athlete.try(:authenticate, athlete_params[:password])
        @athlete = athlete
    end

    def destroy
        session.delete :athlete_id
        redirect_to '/sessions/new'
    end

    private

    def athlete_params
        params.require(:session).permit(:email, :password)
    end
end
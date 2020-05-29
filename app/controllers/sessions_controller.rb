class SessionsController < ApplicationController
    skip_before_action :fetch_user, only: [:new, :create]

    def new
        @athlete = Athlete.find_by(params[:email])
        #what can we do with coach?
        ##
        # @coach = Coach.find_by(params[:email])
        # @athlete || @coach
    end

    def create
        if params[:session][:a_c] == 'coach'
            @user = Coach.find_by(email: params[:email])
            if @user.try(:authenticate, params[:password])
                redirect_to coach_path(@user.id) #need to figure out how to make this redirect to a list of their athletes
            else
                flash[:errors] = "Incorrect User Information"
                redirect_to sessions_new_path
            end
        else
            @user = Athlete.find_by(email: params[:email])
            if @user.try(:authenticate, params[:password])
                redirect_to "/coaches/#{@user.coach_id}"
            else flash[:errors] = "Incorrect User Information"
                redirect_to sessions_new_path
            end
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
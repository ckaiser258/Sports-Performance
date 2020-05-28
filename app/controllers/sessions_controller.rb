class SessionsController < ApplicationController
    def new
        @athlete = Athlete.find_by(params[:email])
    end

    def create
        if params[:session][:a_c] == 'coach'
            @user = Coach.find_by(email: params[:email])
            if @user.try(:authenticate, params[:password])
                redirect_to coach_path(@user.id) #need to figure out how to make this redirect to a list of their athletes
            else
                flash[:errors] = @user.errors.full_messages 
                redirect_to sessions_new_path
            end
        else
            @user = Athlete.find_by(email: params[:email])
            if @user.try(:authenticate, params[:password])
                redirect_to "/coaches/#{@user.coach_id}"
            else flash[:errors] = @user.errors.full_messages 
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
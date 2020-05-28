class ApplicantsController < ApplicationController
  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.create(athlete_params)
    if @athlete.save
      redirect_to @athlete
    else
      render "new"
    end
  end

  private

  def athlete_params
    params.require(:athlete).permit(:name, :age, :email, :password, :password_confirmation)
  end
end

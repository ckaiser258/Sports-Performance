class CoachesController < ApplicationController
  before_action :set_coach, only: [:show, :edit, :update, :destroy]
  helper_method :check_coach

  # GET /coaches
  # GET /coaches.json
  def index
    @coaches = Coach.all
  end

  # GET /coaches/1
  # GET /coaches/1.json
  def show
  end

  # GET /coaches/new
  def new
    @coach = Coach.new
  end

  # GET /coaches/1/edit
  def edit
  end

  # POST /coaches
  # POST /coaches.json
  def create
    @coach = Coach.new(coach_params)
    respond_to do |format|
      if @coach.save
        coach_params[:sport_ids].each do |sportid|
          CoachSport.create(coach_id: @coach.id, sport_id: sportid.to_i)
        end
        format.html { redirect_to @coach, notice: 'Coach was successfully created.' }
        format.json { render :show, status: :created, location: @coach }
      else
        format.html { render :new }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
    session[:coaches_id] = @coach.id
  end

  # PATCH/PUT /coaches/1
  # PATCH/PUT /coaches/1.json
  def update
    @coach = Coach.find(params[:id])
    @coach.update(coach_params)
    # delete old coachsport objects
    @coach.coach_sports.destroy_all
    if params[:coach][:sport_ids] != nil
      params[:coach][:sport_ids].each do |s_id|
        if s_id != ''
          CoachSport.create(coach_id: @coach.id, sport_id: s_id.to_i )
        end
      end
    end
    redirect_to @coach
  end

  # DELETE /coaches/1
  # DELETE /coaches/1.json
  def destroy
    @coach.destroy
    respond_to do |format|
      format.html { redirect_to coaches_url, notice: 'Coach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_coach
    current_user.class == Coach
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach = Coach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coach_params
      params.require(:coach).permit(:name, :bio, :email, :password, :sport_ids => [])
    end
end

class CoachSportsController < ApplicationController
  before_action :set_coach_sport, only: [:show, :edit, :update, :destroy]

  # GET /coach_sports
  # GET /coach_sports.json
  def index
    @coach_sports = CoachSport.all
  end

  # GET /coach_sports/1
  # GET /coach_sports/1.json
  def show
  end

  # GET /coach_sports/new
  def new
    @coach_sport = CoachSport.new
  end

  # GET /coach_sports/1/edit
  def edit
  end

  # POST /coach_sports
  # POST /coach_sports.json
  def create
    @coach_sport = CoachSport.new(coach_sport_params)

    respond_to do |format|
      if @coach_sport.save
        format.html { redirect_to @coach_sport, notice: 'Coach sport was successfully created.' }
        format.json { render :show, status: :created, location: @coach_sport }
      else
        format.html { render :new }
        format.json { render json: @coach_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coach_sports/1
  # PATCH/PUT /coach_sports/1.json
  def update
    respond_to do |format|
      if @coach_sport.update(coach_sport_params)
        format.html { redirect_to @coach_sport, notice: 'Coach sport was successfully updated.' }
        format.json { render :show, status: :ok, location: @coach_sport }
      else
        format.html { render :edit }
        format.json { render json: @coach_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coach_sports/1
  # DELETE /coach_sports/1.json
  def destroy
    @coach_sport.destroy
    respond_to do |format|
      format.html { redirect_to coach_sports_url, notice: 'Coach sport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach_sport
      @coach_sport = CoachSport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coach_sport_params
      params.require(:coach_sport).permit(:coach_id, :sport_id)
    end
end

class AthleteSportsController < ApplicationController
  before_action :set_athlete_sport, only: [:show, :edit, :update, :destroy]

  # GET /athlete_sports
  # GET /athlete_sports.json
  def index
    @athlete_sports = AthleteSport.all
  end

  # GET /athlete_sports/1
  # GET /athlete_sports/1.json
  def show
  end

  # GET /athlete_sports/new
  def new
    @athlete_sport = AthleteSport.new
  end

  # GET /athlete_sports/1/edit
  def edit
  end

  # POST /athlete_sports
  # POST /athlete_sports.json
  def create
    @athlete_sport = AthleteSport.new(athlete_sport_params)

    respond_to do |format|
      if @athlete_sport.save
        format.html { redirect_to @athlete_sport, notice: 'Athlete sport was successfully created.' }
        format.json { render :show, status: :created, location: @athlete_sport }
      else
        format.html { render :new }
        format.json { render json: @athlete_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /athlete_sports/1
  # PATCH/PUT /athlete_sports/1.json
  def update
    respond_to do |format|
      if @athlete_sport.update(athlete_sport_params)
        format.html { redirect_to @athlete_sport, notice: 'Athlete sport was successfully updated.' }
        format.json { render :show, status: :ok, location: @athlete_sport }
      else
        format.html { render :edit }
        format.json { render json: @athlete_sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /athlete_sports/1
  # DELETE /athlete_sports/1.json
  def destroy
    @athlete_sport.destroy
    respond_to do |format|
      format.html { redirect_to athlete_sports_url, notice: 'Athlete sport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_athlete_sport
      @athlete_sport = AthleteSport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def athlete_sport_params
      params.require(:athlete_sport).permit(:athlete_id, :sport_id)
    end
end

class AthletesController < ApplicationController
  before_action :set_athlete, only: [:show, :edit, :update, :destroy]

  # GET /athletes
  # GET /athletes.json
  def index
    @athletes = Athlete.all
  end

  # GET /athletes/1
  # GET /athletes/1.json
  def show
  end

  # GET /athletes/new
  def new
    @athlete = Athlete.new
  end

  # GET /athletes/1/edit
  def edit
  end

  # POST /athletes
  # POST /athletes.json
  def create
    @athlete = Athlete.new(athlete_params)

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to @athlete, notice: 'Athlete was successfully created.' }
        format.json { render :show, status: :created, location: @athlete }
      else
        format.html { render :new }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
    session[:athlete_id] = @athlete.id
  end

  # PATCH/PUT /athletes/1
  # PATCH/PUT /athletes/1.json
  def update
    respond_to do |format|
      if @athlete.update(athlete_params)
        format.html { redirect_to @athlete, notice: 'Athlete was successfully updated.' }
        format.json { render :show, status: :ok, location: @athlete }
      else
        format.html { render :edit }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /athletes/1
  # DELETE /athletes/1.json
  def destroy
    @athlete.destroy
    respond_to do |format|
      format.html { redirect_to athletes_url, notice: 'Athlete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_athlete
    @athlete = Athlete.find(params[:coach][:athlete_ids])
    @athlete.coach_id = params[:coach_id]
    @athlete.save!
    redirect_to coach_path(@athlete.coach_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def athlete_params
      params.require(:athlete).permit(:name, :age, :email, :password, :sport_ids => [])
    end
end

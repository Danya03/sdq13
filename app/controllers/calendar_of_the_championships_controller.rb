class CalendarOfTheChampionshipsController < ApplicationController
  before_action :set_calendar_of_the_championship, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index2]
  skip_before_action :check_app_auth, only: [:index2]
  before_action -> {check_role('admin', 'operator')}, except: [:index2]

  # GET /calendar_of_the_championships
  # GET /calendar_of_the_championships.json
  def index
    @calendar_of_the_championships = CalendarOfTheChampionship.all
  end
  def index2
    @calendar_of_the_championships = CalendarOfTheChampionship.all
  end

  # GET /calendar_of_the_championships/1
  # GET /calendar_of_the_championships/1.json
  def show
  end

  # GET /calendar_of_the_championships/new
  def new
    @calendar_of_the_championship = CalendarOfTheChampionship.new
  end

  # GET /calendar_of_the_championships/1/edit
  def edit
  end

  # POST /calendar_of_the_championships
  # POST /calendar_of_the_championships.json
  def create
    @calendar_of_the_championship = CalendarOfTheChampionship.new(calendar_of_the_championship_params)

    respond_to do |format|
      if @calendar_of_the_championship.save
        format.html { redirect_to @calendar_of_the_championship, notice: 'Calendar of the championship was successfully created.' }
        format.json { render :show, status: :created, location: @calendar_of_the_championship }
      else
        format.html { render :new }
        format.json { render json: @calendar_of_the_championship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendar_of_the_championships/1
  # PATCH/PUT /calendar_of_the_championships/1.json
  def update
    respond_to do |format|
      if @calendar_of_the_championship.update(calendar_of_the_championship_params)
        format.html { redirect_to @calendar_of_the_championship, notice: 'Calendar of the championship was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar_of_the_championship }
      else
        format.html { render :edit }
        format.json { render json: @calendar_of_the_championship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_of_the_championships/1
  # DELETE /calendar_of_the_championships/1.json
  def destroy
    @calendar_of_the_championship.destroy
    respond_to do |format|
      format.html { redirect_to calendar_of_the_championships_url, notice: 'Calendar of the championship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_of_the_championship
      @calendar_of_the_championship = CalendarOfTheChampionship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_of_the_championship_params
      params.require(:calendar_of_the_championship).permit(:gp_name, :number, :race_date, :country, :location)
    end
end

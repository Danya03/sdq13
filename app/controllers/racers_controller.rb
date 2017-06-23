class RacersController < ApplicationController
  before_action :set_racer, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index2, :search]
  skip_before_action :check_app_auth, only: [:index2, :search ]
  before_action -> {check_role('admin', 'operator')}, except: [:index2, :search]
  # GET /racers
  # GET /racers.json
  def index
    @racers = Racer.all
  end
  def example
    @countries=[]
    (Racer.all).each do |r|
      if !(@countries.include?(r.country))
        @countries<<r.country
      end

    end
    @motor_manufacturers=[]

    @teams= []
    @n1<<t.car_number1
    @n1<<t.car_number2
    @team_countries=[]
    (Team.all).each do |t|
      @motor_manufacturers<<t.motor_manufacturer
      @n1<<t.car_number1
      @n2<<t.car_number2
      @team_countries<<t.team_country

    end
    @motor_manufacturers=@motor_manufacturers.uniq
    @team_countries= @team_countries.uniq



    (Racer.all).each do |r|
      if !(@teams.include?(r.teams1.first.try(:team_name)))
        @teams<<(r.teams1[0]).try(:team_name)
      end
      if !(@teams.include?(r.teams2.first.try(:team_name)))
        @teams<<(r.teams2[0]).try(:team_name)
      end
    @teams.compact!
    end
    if params.has_key?('search')
      @racers=Racer.search(params['search'])
    else
      @racers=[]
    end
    params['search'] ||= {}
  end
  def index2
    @racers = Racer.all
  end

  def search
    @countries=[]
    (Racer.all).each do |r|
      if !(@countries.include?(r.country))
        @countries<<r.country
      end

    end
    @motor_manufacturers=[]

    @teams= []
    @n1=[]
    @n2=[]
    @team_countries=[]
    (Team.all).each do |t|
      @motor_manufacturers<<t.motor_manufacturer
      @n1<<t.car_number1
      @n1<<t.car_number2
      @team_countries<<t.team_country

    end
    @motor_manufacturers=@motor_manufacturers.uniq
    @team_countries= @team_countries.uniq



    (Racer.all).each do |r|
      if !(@teams.include?(r.teams1.first.try(:team_name)))
        @teams<<(r.teams1[0]).try(:team_name)
      end
      if !(@teams.include?(r.teams2.first.try(:team_name)))
        @teams<<(r.teams2[0]).try(:team_name)
      end
    @teams.compact!
    end
    if params.has_key?('search')
      @racers=Racer.search(params['search'])
    else
      @racers=[]
    end
    params['search'] ||= {}
  end

  # GET /racers/1
  # GET /racers/1.json
  def show
  end

  # GET /racers/new
  def new
    @racer = Racer.new
  end

  # GET /racers/1/edit
  def edit
  end

  # POST /racers
  # POST /racers.json
  def create
    @racer = Racer.new(racer_params)

    respond_to do |format|
      if @racer.save
        format.html { redirect_to @racer, notice: 'Racer was successfully created.' }
        format.json { render :show, status: :created, location: @racer }
      else
        format.html { render :new }
        format.json { render json: @racer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /racers/1
  # PATCH/PUT /racers/1.json
  def update
    respond_to do |format|
      if @racer.update(racer_params)
        format.html { redirect_to @racer, notice: 'Racer was successfully updated.' }
        format.json { render :show, status: :ok, location: @racer }
      else
        format.html { render :edit }
        format.json { render json: @racer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /racers/1
  # DELETE /racers/1.json
  def destroy
    @racer.destroy
    respond_to do |format|
      format.html { redirect_to racers_url, notice: 'Racer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racer
      @racer = Racer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def racer_params
      params.require(:racer).permit(:surname, :firstname, :bday, :country, :number_of_wins)
    end
end

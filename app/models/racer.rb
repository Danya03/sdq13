class Racer < ActiveRecord::Base
  has_many :teams1, class_name: 'Team', foreign_key: 'racer1_id'
  has_many :teams2, class_name: 'Team', foreign_key: 'racer2_id'

  validates :surname, :firstname, :bday, :country, :number_of_wins, presence: true

  def self.search(params)
    # result=Racer.joins(:teams1)+Racer.joins(:teams2)
    result = Racer.includes(:teams1,:teams2).references(:teams1,:teams2)

    if params['surname'].present?
      result=result.where(surname: params['surname'])
    end
    if params['firstname'].present?
      result=result.where(firstname: params['firstname'])
    end
    if params['bday'].present?
      result=result.where(bday: params['bday'])
    end
    if params['country'].present?
      result=result.where(country: params['country'])
    end
    if params['number_of_wins'].present?
      result=result.where(number_of_wins: params['number_of_wins'])
    end
    # if params['team_name'].present?
    #    (result.where(teams: {racer1_id: params['racer1_id']}))
    # end
    if  (params['racer1_id'].present?) and (params['racer2_id'].present?)
      result=[]
    elsif  (params['racer1_id'].present?)
      result= result.where.not(teams: {racer1_id: nil})
    elsif  (params['racer2_id'].present?)
      result= result.where.not(teams2s_racers: {racer2_id: nil})

    end
    if params['team_name'].present?
      result= result.where(teams2s_racers: {team_name: params['team_name']}) +
       (result.where(teams: {team_name: params['team_name']}))
    end
    if params['motor_manufacturer'].present?
      result= result.where(teams2s_racers: {motor_manufacturer: params['motor_manufacturer']}) +
       (result.where(teams: {motor_manufacturer: params['motor_manufacturer']}))
    end
    if params['car_number1'].present?
      result= (result.where(teams: {car_number1: params['car_number1']})) +
       (result.where(teams2s_racers: {car_number2: params['car_number1']}))
    end
    if params['team_country'].present?
      result= result.where(teams2s_racers: {team_country: params['team_country']}) +
       (result.where(teams: {team_country: params['team_country']}))
    end

    result
  end

end

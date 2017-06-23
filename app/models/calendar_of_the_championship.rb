class CalendarOfTheChampionship < ActiveRecord::Base

    validates :gp_name, :race_date, :country, :location, presence: true
    validates :number, numericality: {only_integer: true, allow_nil: false}
    validates :number, uniqueness: true

end

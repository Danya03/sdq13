json.extract! racer, :id, :surname, :firstname, :bday, :country, :number_of_wins, :created_at, :updated_at
json.url racer_url(racer, format: :json)

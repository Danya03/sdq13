class CreateRacers < ActiveRecord::Migration
  def change
    create_table :racers do |t|
      t.string :surname, null: false
      t.string :firstname, null: false
      t.date :bday, null: false
      t.string :country, null: false
      t.integer :number_of_wins, null: false

      t.timestamps null: false
    end
  end
end

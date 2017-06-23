class CreateCalendarOfTheChampionships < ActiveRecord::Migration
  def change
    create_table :calendar_of_the_championships do |t|
      t.string :gp_name, null: false
      t.string :number, null: false
      t.date :race_date, null: false
      t.string :country, null: false
      t.string :location, null: false
      t.index [:number,:country], unique: true
      t.timestamps null: false
    end
  end
end

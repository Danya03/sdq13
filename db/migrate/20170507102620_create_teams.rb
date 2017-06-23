class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name, null: false
      t.integer :racer1_id
      t.integer :racer2_id
      t.string :motor_manufacturer, null: false
      t.string :car_number1
      t.string :car_number2
      t.string :team_country, null: false

      t.timestamps null: false
    end
    reversible do |dir|
  		dir.up do
  			execute ("ALTER TABLE teams ADD FOREIGN KEY (racer1_id) REFERENCES racers(id)")
        execute ("ALTER TABLE teams ADD FOREIGN KEY (racer2_id) REFERENCES racers(id)")
      end

    end
  end
end

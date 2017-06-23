class Team < ActiveRecord::Base
  belongs_to :racer1, class_name: 'Racer', dependent: :destroy
  belongs_to :racer2, class_name: 'Racer', dependent: :destroy

  accepts_nested_attributes_for :racer1, allow_destroy: true
  accepts_nested_attributes_for :racer2, allow_destroy: true


  validates :team_name, :motor_manufacturer, :car_number1, :car_number2, :team_country, presence: true
  # validates :racer1_id, numericality: {only_integer: true, allow_nil: false,  message: "Поля гонщик1 и гонщик2 не должны быть пустыми или равными между собой"}
  # validates  :racer2_id, numericality: {only_integer: true, allow_nil: false,  message: "Поля гонщик1 и гонщик2 не должны быть пустыми или равными между собой"}


  validates :team_name, uniqueness: true


    protected
    def eq()
      if (self.racer1_id == self.racer2_id) then
        self.racer1_id = nil
        self.racer2_id = nil

      end
end
 end

class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :type_appointment, foreign_key: true
      t.text :description
      t.belongs_to :user, foreign_key: true
      t.belongs_to :doctor, foreign_key: true
      t.belongs_to :estate, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end

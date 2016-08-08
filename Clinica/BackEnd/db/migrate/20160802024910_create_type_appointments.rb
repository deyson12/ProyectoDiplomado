class CreateTypeAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :type_appointments do |t|
      t.string :codigo
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end

class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :last_name
      t.belongs_to :level_doctor
      t.belongs_to :estate, foreign_key: true
      t.date :admission_date
      t.belongs_to :clinic, foreign_key: true

      t.timestamps
    end
  end
end

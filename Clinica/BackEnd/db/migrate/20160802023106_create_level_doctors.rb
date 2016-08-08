class CreateLevelDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :level_doctors do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

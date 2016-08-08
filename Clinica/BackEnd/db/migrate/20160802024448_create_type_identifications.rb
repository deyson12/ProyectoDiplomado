class CreateTypeIdentifications < ActiveRecord::Migration[5.0]
  def change
    create_table :type_identifications do |t|
      t.string :codigo
      t.string :description

      t.timestamps
    end
  end
end

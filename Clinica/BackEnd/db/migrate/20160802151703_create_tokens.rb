class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :token
      t.integer :number_of_request, default: 0
      t.string :name
      t.belongs_to :estate, foreign_key: true

      t.timestamps
    end
  end
end

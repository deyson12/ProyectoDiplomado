class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.belongs_to :type_identification, foreign_key: true
      t.string :identification
      t.string :user_name
      t.string :password_digest
      t.string :email
      t.belongs_to :estate, foreign_key: true

      t.timestamps
    end
  end
end

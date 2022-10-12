class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      
      t.string :titel, null: false
      t.date :release_date, null: false
      t.text :comment, null: false
      t.string :publisher, null: false

      t.timestamps
    end
  end
end

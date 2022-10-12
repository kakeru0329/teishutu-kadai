class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.text :background, null: false
      t.float :evaluation, null: false

      t.timestamps
    end
  end
end

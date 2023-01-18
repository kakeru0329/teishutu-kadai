# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :background
      t.float :evaluation
      t.string :review_title
      t.integer :customer_id
      t.integer :tag_id
      t.timestamps
    end
  end
end

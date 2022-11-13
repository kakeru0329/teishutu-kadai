# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create!(
  tag_name: "RPG"
)
Tag.create!(
  tag_name: "シューティング"
)
Tag.create!(
  tag_name: "ファンタジー"
)
Tag.create!(
  tag_name: "FPS"
)
Tag.create!(
  tag_name: "パズル"
)
Tag.create!(
  tag_name: "アクション"
)
Tag.create!(
  tag_name: "レース"
)



Admin.create!(
   email: 'admin@admin',
   password: 'testtest',
   name: 'admin',
   age: '00'
)
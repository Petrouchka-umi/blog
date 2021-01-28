# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  id: 1,
  name: 'umi',
  email: ENV['email01'],
  password: ENV['password01'],
  admin: true
)

User.create!(
  id: 2,
  name: 'KaWa',
  email: ENV['email02'],
  password: ENV['password02'],
  admin: true
)

# カテゴリー
life = Category.create!(name: "自己啓発")

money = Category.create!(name: "マネー")

programming = Category.create!(name: "プログラミング")

technology = Category.create!(name: "ITインフラ")

health　= Category.create!(name: "健康")

gourmet = Category.create!(name: "グルメ")

hobby　= Category.create!(name: "趣味")
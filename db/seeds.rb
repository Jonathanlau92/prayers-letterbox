# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

qingfeng = User.create(email: 'jonathan@gmail.com', password: 'password')
qingfeng.add_role(:user)
qingfeng.add_role(:admin)
tim = User.create(email: 'timhou@gmail.com', password: 'password')
tim.add_role(:user)
tim.add_role(:admin)

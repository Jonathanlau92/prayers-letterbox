# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

qingfeng = User.create(email: 'jonathan@gmail.com', password: 'password', name: 'qf')
qingfeng.add_role(:user)
qingfeng.add_role(:admin)
tim = User.create(email: 'timhou@gmail.com', password: 'password', name: 'tim')
tim.add_role(:user)
tim.add_role(:admin)

# Add more user to test
kenny = User.create(email: 'kenny@gmail.com', password: 'password', name: 'kenny')
tinghan = User.create(email: 'daniel@gmail.com', password: 'password', name: 'tinghan')
daniel = User.create(email: 'tinghan@gmail.com', password: 'password', name: 'daniel')
john = User.create(email: 'john@gmail.com', password: 'password', name: 'john')
brandon = User.create(email: 'brand@gmail.com', password: 'password', name: 'brandon')
nancy = User.create(email: 'nancy@gmail.com', password: 'password', name: 'nancy')

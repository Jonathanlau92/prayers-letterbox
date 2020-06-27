# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

qingfeng = User.create(email: 'jonathan@gmail.com', password: 'password', name: 'qf', confirmed_at: Time.now)
qingfeng.add_role(:user)
qingfeng.add_role(:admin)
tim = User.create(email: 'timhou@gmail.com', password: 'password', name: 'tim', confirmed_at: Time.now)
tim.add_role(:user)
tim.add_role(:admin)

# Add more user to test
kenny = User.create(email: 'kenny@gmail.com', password: 'password', name: 'kenny', confirmed_at: Time.now)
tinghan = User.create(email: 'daniel@gmail.com', password: 'password', name: 'tinghan', confirmed_at: Time.now)
daniel = User.create(email: 'tinghan@gmail.com', password: 'password', name: 'daniel', confirmed_at: Time.now)
john = User.create(email: 'john@gmail.com', password: 'password', name: 'john', confirmed_at: Time.now)
brandon = User.create(email: 'brand@gmail.com', password: 'password', name: 'brandon', confirmed_at: Time.now)
nancy = User.create(email: 'nancy@gmail.com', password: 'password', name: 'nancy', confirmed_at: Time.now)

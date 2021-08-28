# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Guest.destroy_all
Bed.destroy_all
Good.destroy_all
Bakery.destroy_all

bed = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
Guest.create!(bed_id: bed.id,first_name: 'Captain', last_name: 'Hook', rent: 300, visiting: true)
Guest.create!(bed_id: bed.id,first_name: 'Cruella',last_name: 'Deville',rent: 300,visiting: true)
Guest.create!(bed_id: bed.id, first_name: 'Scar', last_name: 'Lionsmain', rent: 300, visiting: true)
Guest.create!(bed_id: bed.id, first_name: 'Jafar', last_name: 'Skinnybeard', rent: 300, visiting: true)
Guest.create!(bed_id: bed.id, first_name: 'Gaston', last_name: 'Hunterson', rent: 300, visiting: true)

bakery_1 = Bakery.create!(name: "Taste of Denmark", city: "Lakewood", delivery: true, review: 5)
bakery_2 = Bakery.create!(name:"Bread", city: "Durango", delivery: true, review: 4)
good_1 = Good.create!(name: "Cinnamon Roll", category: "Pastry", days_old: 0, gluten_free: true, bakery_id: bakery_1.id)
good_2 = Good.create!(name: "Pumpkin Bread", category: "Bread", days_old: 1, gluten_free: true, bakery_id: bakery_1.id)
good_3 = Good.create!(name: "Chocolate Chip Cookie", category: "Cookie", days_old: 1, gluten_free: true, bakery_id: bakery_2.id)

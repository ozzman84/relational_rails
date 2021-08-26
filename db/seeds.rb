# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Guest.destroy_all
Bed.destroy_all

bed = Bed.create!(name: 'Master Bed', occupied: true, guest_count: 0)
Guest.create!(bed_id: bed.id,first_name: 'Captain', last_name: 'Hook', rent: 300, visiting: true)
Guest.create!(bed_id: bed.id,first_name: 'Cruella',last_name: 'Deville',rent: 300,visiting: true)
Guest.create!(bed_id: bed.id, first_name: 'Scar', last_name: 'Lionsmain', rent: 300, visiting: true)
Guest.create!(bed_id: bed.id, first_name: 'Jafar', last_name: 'Skinnybeard', rent: 300, visiting: true)
Guest.create!(bed_id: bed.id, first_name: 'Gaston', last_name: 'Hunterson', rent: 300, visiting: true)

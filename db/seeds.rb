# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create first_name: 'Seanie', last_name: 'Mac',
            email: 'seanie_mac@krisskross4eva.com'
User.create first_name: 'Mac', last_name: 'Seanie',
            email: 'mac_seanie@krisskross4eva.com'
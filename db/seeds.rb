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

# United States
states = [
  ['AK', 'Alaska'],
  ['AL', 'Alabama'],
  ['AR', 'Arkansas'],
  ['AS', 'American Samoa'],
  ['AZ', 'Arizona'],
  ['CA', 'California'],
  ['CO', 'Colorado'],
  ['CT', 'Connecticut'],
  ['DC', 'District of Columbia'],
  ['DE', 'Delaware'],
  ['FL', 'Florida'],
  ['GA', 'Georgia'],
  ['GU', 'Guam'],
  ['HI', 'Hawaii'],
  ['IA', 'Iowa'],
  ['ID', 'Idaho'],
  ['IL', 'Illinois'],
  ['IN', 'Indiana'],
  ['KS', 'Kansas'],
  ['KY', 'Kentucky'],
  ['LA', 'Louisiana'],
  ['MA', 'Massachusetts'],
  ['MD', 'Maryland'],
  ['ME', 'Maine'],
  ['MI', 'Michigan'],
  ['MN', 'Minnesota'],
  ['MO', 'Missouri'],
  ['MS', 'Mississippi'],
  ['MT', 'Montana'],
  ['NC', 'North Carolina'],
  ['ND', 'North Dakota'],
  ['NE', 'Nebraska'],
  ['NH', 'New Hampshire'],
  ['NJ', 'New Jersey'],
  ['NM', 'New Mexico'],
  ['NV', 'Nevada'],
  ['NY', 'New York'],
  ['OH', 'Ohio'],
  ['OK', 'Oklahoma'],
  ['OR', 'Oregon'],
  ['PA', 'Pennsylvania'],
  ['PR', 'Puerto Rico'],
  ['RI', 'Rhode Island'],
  ['SC', 'South Carolina'],
  ['SD', 'South Dakota'],
  ['TN', 'Tennessee'],
  ['TX', 'Texas'],
  ['UT', 'Utah'],
  ['VA', 'Virginia'],
  ['VI', 'Virgin Islands'],
  ['VT', 'Vermont'],
  ['WA', 'Washington'],
  ['WI', 'Wisconsin'],
  ['WV', 'West Virginia'],
  ['WY', 'Wyoming']
]

states.each do |abbrev, name|
  State.create abbrev: abbrev, name: name
end
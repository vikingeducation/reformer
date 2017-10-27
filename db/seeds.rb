# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

# Users and addresses
denver = City.create name: 'Denver'
state = State.find_by abbrev: 'CO'

user1 = User.create first_name: 'Seanie', last_name: 'Mac',
                    email: 'seanie_mac@krisskross4eva.com'

user2 = User.create first_name: 'Mac', last_name: 'Seanie',
                    email: 'mac_seanie@krisskross4eva.com'

Address.create street_1: '1270 Von Horrible Street',
               city: denver, state: state, post_code: '80205', user: user1

Address.create street_1: '233 KrisKross Drive', city: denver,
               state: state, post_code: '80015', user: user1

Address.create street_1: '4545 S. Crystal Way', city: denver, state: state,
               post_code: '80502', user: user2

Address.create street_1: '235 KrisKross Drive', city: denver,
               state: state, post_code: '80015', user: user2

# credit cards
user1.cards.create(
  [{
     number: '1234567890123456',
     expires: 1.year.from_now,
     cv2: 123
   },
   {
     number: '1234567890123456'.reverse,
     expires: 1.year.from_now,
     cv2: 223
   }]
)

user2.cards.create(
  [{
     number: '5554443890123456',
     expires: 1.year.from_now,
     cv2: 123
   },
   {
     number: '1234565558886698',
     expires: 1.year.from_now,
     cv2: 223
   }]
)

# categories and products
require 'faker/commerce'
5.times do |i|
  c = Category.create name: "Category #{i + 1}"

  3.times do
    c.products.create name: Faker::Commerce.product_name, price: 2.00
  end
end
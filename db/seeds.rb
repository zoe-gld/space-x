puts 'Cleaning users'
User.destroy_all

puts 'Creating users...'

Faker::Config.locale = 'pt'

50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
  User.create(
    first_name: user.first_name,
    last_name: user.last_name,
    email: "#{user.first_name}.#{user.last_name}@#{Faker::Internet.domain_name}",
    phone_number: Faker::PhoneNumber.cell_phone,
    password: Faker::Internet.password(min_length: 6)
  )
end
puts 'Users created'

puts 'Cleaning spaces...'
Space.destroy_all

SAMPLE = ['concert hall','movie theater', 'house', 'cave', 'museum', 'art gallery', 'aquarium']

100.times do
  space = Space.create(
    name: Faker::Address.unique.community,
    address: Faker::Address.full_address,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum ex aliquam earum, obcaecati quos hic modi dignissimos, veniam sunt in pariatur natus expedita excepturi perferendis animi voluptatem velit neque dolore.',
    category: SAMPLE.sample,
    price: 1000,
    owner_id: User.find(User.first.id + rand(50)).id
    )
end

puts 'Done!'

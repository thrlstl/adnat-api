require 'faker'
require 'bcrypt'

puts 'clearing PostgreSQL database...'
OrganizationUser.destroy_all
Shift.destroy_all
User.destroy_all
Organization.destroy_all

puts 'creating Users...'
10.times do User.create(
    name: Faker::Name.name,
    email_address: Faker::Internet.safe_email,
    password: 'adnatdemo'
)
end

puts 'creating Demo User...'
User.create(
    name: 'Demo User',
    email_address: 'demo_user@adnat.com',
    password: 'adnatdemo'
)

puts 'creating Organizations...'
10.times do Organization.create(
    name: Faker::Company.name,
    hourly_rate: Faker::Commerce.price(range: 15.00..75.00)
)
end

puts 'Users are joining Organizations...'
30.times do OrganizationUser.find_or_create_by(
    user_id: User.all.sample.id,
    organization_id: Organization.all.sample.id,
)
end


puts 'Users are picking up shifts...'
50.times do |n|
    start = Faker::Time.between_dates(from: Date.today - 1, to: Date.today - 1, period: :morning)  
    finish = Faker::Time.between_dates(from: Date.today - 1, to: Date.today - 1, period: :evening)
    break_length = Faker::Number.between(from: 30, to: 60)
    association = OrganizationUser.all.sample
    Shift.create(
        :organization_id => association.organization_id,
        :user_id => association.user_id,
        :start => start,
        :finish => finish,
        :break_length => break_length
    )
end
  
puts 'PostgreSQL database successfully seeded!'



require 'faker'
require 'bcrypt'

puts 'clearing database...'
OrganizationUser.destroy_all
Shift.destroy_all
User.destroy_all
Organization.destroy_all

puts 'creating Users...'
10.times do User.create(
    name: Faker::Name.name,
    email_address: Faker::Internet.safe_email,
    password: 'password'
)
end

puts 'creating Organizations...'
5.times do Organization.create(
    name: Faker::Company.name,
    hourly_rate: Faker::Number.between(from: 15, to: 75)
)
end

puts 'connecting Users to Organizations...'
10.times do OrganizationUser.create(
    user_id: User.all.sample.id,
    organization_id: Organization.all.sample.id,
)
end

puts 'creating shifts for Users...'
20.times do Shift.create(
    user_id: User.all.sample.id,
    organization_id: Organization.all.sample.id,
    start: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :morning),
    finish: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :evening),
    break_length: Faker::Number.between(from: 1, to: 60)
)
end

puts 'Database successfully updated!'



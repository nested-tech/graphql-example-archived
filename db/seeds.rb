# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

200.times do
  company = Company.create({
    name:         Faker::Company.name,
    catch_phrase: Faker::Company.catch_phrase
  })

  (1..10).to_a.sample.times do
    first_name = Faker::Name.first_name
    last_name  = Faker::Name.last_name

    Employee.create({
      companies_id: company.id,
      first_name:   first_name,
      last_name:    last_name,
      age:          (18..70).to_a.sample,
      email:        Faker::Internet.email("#{first_name}.#{last_name}")
    })
  end
end

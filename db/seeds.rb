# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Blog.destroy_all
Comment.destroy_all

10.times do
    Patient.create(name: Faker::Name.name, insurance_co: Faker::Beer.malts, gender: "F", new_patient: Faker::Boolean.boolean)
    Doctor.create(name: Faker::Name.name, specialty: Faker::Hipster.word, gender: "F", insurance: Faker::Boolean.boolean)
end

10.times do
    Appointment.create(location: Faker::University.name, day: Faker::Date.forward(23), reason: Faker::Hipster.sentence(6), patient_id: Faker::Number.between(1, 10), doctor_id: Faker::Number.between(1, 10))
end

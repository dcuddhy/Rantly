User.delete_all
Rant.delete_all

User.create!(
  first_name: "Basic",
  last_name: "User",
  email: "user@example.com",
  password: "pass"
)


10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "pass"
  )
end

20.times do |i|
  Rant.create!(
    title: Faker::Lorem.sentence(3, true, 4),
    body: Faker::Lorem.paragraph(6, false, 4),
    user_id: Faker::Number.number(2)
  )
end

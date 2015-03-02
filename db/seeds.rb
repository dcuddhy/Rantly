User.delete_all
Rant.delete_all

10.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

600.times do |i|
  Rant.create!(
    title: Faker::Lorem.sentence(3, true, 4),
    body: Faker::Lorem.paragraph,
    user_id: Faker::Number.number(2)
  )
end

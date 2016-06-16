5.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end
  users = User.all

20.times do
  Wiki.create!(
  user: users.sample,
  title: Faker::Book.title,
  body: Faker::Lorem.paragraph(4)
  )
end

User.destroy_all
Wiki.destroy_all
Collaboration.destroy_all

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    confirmed_at: Time.now
  )
end
users = User.all

User.create(
  email:"testuser@user.com",
  password:"helloworld",
  confirmed_at: Time.now
)

20.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph(4),
    private: false
  )
end

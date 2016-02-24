User.create!(name: "dawn",
             email: "1142144213@qq.com",
             password:            "tobeno.1",
             password_confirmation: "tobeno.1",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
   end
               
  users = User.order(:created_at).take(6)
  50.times do
    content = Faker::Lorem.sentence(5)             #Faker::Lorem.sentences can make 'lorem ipsum' TEXT
    users.each { |user| user.microposts.create!(content: content) }
  end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
following.each { |follower| follower.follow(user) }
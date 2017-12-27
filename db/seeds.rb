User.create!(user_id:  "exampleuser",
email: "example@railstutorial.org",
password:              "foobar",
password_confirmation: "foobar")

user = User.first

10.times do
  task = Faker::GameOfThrones.city
  user.categories.create!(title: task)
end
user = User.create!(user_id:  "exampleuser1",
        email: "example2@railstutorial.org",
        password:              "foobar",
        password_confirmation: "foobar")

10.times do
  task = Faker::GameOfThrones.city
  user.categories.create!(title: task)
end
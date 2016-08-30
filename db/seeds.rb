99.times do
	Member.create!(firstname: Faker::Name.first_name,
  lastname: Faker::Name.last_name,
  email: Faker::Internet.email)
end

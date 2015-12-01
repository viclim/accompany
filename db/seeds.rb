# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Department
departments = ['IT', 'Accounting', 'HR', 'Marketing', 'Sales'].map do |name|
  Department.create(name: name)
end

# Underling
(1..50).each do |i|
  User.create(
    email: "underling.#{i}@qwerty.com",
    first_name: "Under#{i}", last_name: 'Ling',
    password: "Underling_#{i}", password_confirmation: "Underling_#{i}",
    department: departments[(i / 10.0).ceil - 1]
  )
end

# Boss
User.create(
  email: 'boss@qwerty.com',
  first_name: 'Big', last_name: 'Bossu',
  password: 'Bossu_123', password_confirmation: 'Bossu_123',
  role: 'boss'
)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Test Admin", email_id: "test_admin@test.com", role: 0)
User.create(name: "Test Customer 1", email_id: "test_customer_1@test.com", role: 1, address: "Sample Address")
User.create(name: "Test Customer 2", email_id: "test_customer_2@test.com", role: 1, address: "Sample Address 1")
User.create(name: "Test Customer 3", email_id: "test_customer_3@test.com", role: 1, address: "Sample Address 2")
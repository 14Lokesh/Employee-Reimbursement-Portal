# db/seeds.rb

require 'faker'

# Create 10 companies
10.times do
  Company.create(
    name: Faker::Company.name,
    employee_count: Faker::Number.between(from: 10, to: 100),
    total_reimbursement: Faker::Number.decimal(l_digits: 5, r_digits: 2)
  )
end

# Create 10 users
10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create(Faker::Internet.password)
  )
end

# Create 10 employees, each associated with a random company
Company.find_each do |company|
  10.times do
    Employee.create(
      name: Faker::Name.name,
      company_id: company.id
    )
  end
end

# Create 10 reimbursement claims, each associated with a random employee
Employee.find_each do |employee|
  10.times do
    ReimbursementClaim.create(
      purpose: Faker::Lorem.sentence,
      amount: Faker::Number.decimal(l_digits: 4, r_digits: 2),
      date_of_expenditure: Faker::Date.between(from: 1.year.ago, to: Date.today),
      employee_id: employee.id
    )
  end
end

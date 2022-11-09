require 'rails_helper'

RSpec.describe Employee, type: :model do
    it "is invalid without attributes" do 
        expect(Employee.new).to be_invalid
    end
    it "is not valid without first_name" do
        employee = Employee.new(first_name: nil)
        expect(employee).to be_invalid
    end
    it "is not valid without last_name" do
        employee = Employee.new(last_name: nil)
        expect(employee).to be_invalid
    end
    it "is not valid without email" do
        employee = Employee.new(email: nil)
        expect(employee).to be_invalid
    end
    it "is not valid without phone" do
        employee = Employee.new(phone: nil)
        expect(employee).to be_invalid
    end
    it "is invalid when length of first name is greater then 25" do
        employee = Employee.new(first_name: Faker::Alphanumeric.alpha(number: 26))
        expect(employee).to be_invalid
    end
    it "is invalid when length of last name is greater then 50" do
        employee = Employee.new(last_name: Faker::Alphanumeric.alpha(number: 60))
        expect(employee).to be_invalid
    end

    it "is valid when length of first name is less then 25 and last_name less than 50 and email provided and phone provided" do
        employee = Employee.new
        employee.first_name = Faker::Alphanumeric.alpha(number: 20)
        employee.last_name = Faker::Alphanumeric.alpha(number: 30)
        employee.nickname = Faker::Name.first_name
        employee.email = Faker::Internet.email
        employee.phone = Faker::Number.number(digits: 10).to_s
        expect(employee).to be_valid
    end
    it "is valid regardless of nickname is provided or not" do
        employee = Employee.new
        employee.first_name = Faker::Alphanumeric.alpha(number: 20)
        employee.last_name = Faker::Alphanumeric.alpha(number: 30)
        employee.email = Faker::Internet.email
        employee.phone = Faker::Number.number(digits: 10).to_s
        expect(employee).to be_valid
    end
    
end

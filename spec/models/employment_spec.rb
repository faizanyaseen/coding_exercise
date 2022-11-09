require 'rails_helper'

RSpec.describe Employment, type: :model do
    it "is invalid without attributes" do 
        expect(Employment.new).to be_invalid
    end
    it "is not valid without an employer" do
        employment = Employment.new(employer: nil)
        expect(employment).to be_invalid
    end
    it "is not valid without a date_started" do
        employment = Employment.new(date_started: nil)
        expect(employment).to be_invalid
    end
    it "is not valid without a date_employment_ended" do
        employment = Employment.new(date_employment_ended: nil)
        expect(employment).to be_invalid
    end
    it "is invalid with an employer but dates missing" do
        employment = Employment.new(employer: Faker::Name.name)
        expect(employment).to be_invalid
    end
    it "is invalid with a date_started but employer and date_employment_ended missing" do
        employment = Employment.new(date_started: Faker::Date.in_date_period)
        expect(employment).to be_invalid
    end
    it "is invalid with a date_employment_ended but employer and date_started missing" do
        employment = Employment.new(date_employment_ended: Faker::Date.in_date_period)
        expect(employment).to be_invalid
    end
    it "is valid when employer, date_employment_ended and date_started are provided" do
        employment = Employment.new(employer: Faker::Name.name, date_started: Faker::Date.in_date_period, date_employment_ended: Faker::Date.in_date_period)
        expect(employment).to be_valid
    end
end

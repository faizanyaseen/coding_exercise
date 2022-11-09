class Employee < ApplicationRecord
    validates :first_name, presence: true
    validates :first_name, length: {maximum: 25}
    validates :last_name, presence: true
    validates :first_name, length: {maximum: 50}
    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true
end

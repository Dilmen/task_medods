class Patient < ApplicationRecord
    has_many :consultation_request
    has_many :recommendation, through: :consultation_request
end

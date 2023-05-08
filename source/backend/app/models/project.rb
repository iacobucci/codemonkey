class Project < ApplicationRecord
  has_and_belongs_to_many :codemonkeys
  has_and_belongs_to_many :companies
end

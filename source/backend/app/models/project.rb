class Project < ApplicationRecord
  belongs_to :user
  belongs_to :codemonkey
  belongs_to :company
end

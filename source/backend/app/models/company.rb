class Company < ApplicationRecord
  self.primary_key = "username"
  belongs_to :user, -> { where(kind: "company") }, foreign_key: "username", primary_key: "username", optional: true
end

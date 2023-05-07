class Admin < ApplicationRecord
  self.primary_key = "username"
  belongs_to :user, -> { where(kind: "admin") }, foreign_key: "username", primary_key: "username", optional: true
end

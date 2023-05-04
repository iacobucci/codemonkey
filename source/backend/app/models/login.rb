class Login < ApplicationRecord
  self.table_name = "codemonkey.logins"
  self.primary_key = "username"

  validates :username, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 255 }
end

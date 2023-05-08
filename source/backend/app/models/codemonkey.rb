class Codemonkey < ApplicationRecord
  self.primary_key = "username"
  belongs_to :user, -> { where(kind: "codemonkey") }, foreign_key: "username", primary_key: "username", optional: true

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :technologies

  # validates :username, presence: true, uniqueness: true
  # validates :bio, length: { maximum: 4095 }
  # validates :stato, inclusion: { in: ["pending", "active", "suspended", "banned"] }

  # validates :user, presence: true
end

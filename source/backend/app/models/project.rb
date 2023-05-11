class Project < ApplicationRecord
  belongs_to :codemonkey
  belongs_to :company
  has_and_belongs_to_many :technologies, join_table: "projects_technologies", dependent: :destroy, on_delete: :cascade
end

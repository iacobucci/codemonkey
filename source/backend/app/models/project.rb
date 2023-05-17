class Project < ApplicationRecord
  belongs_to :codemonkey
  belongs_to :company
  has_and_belongs_to_many :technologies, join_table: "projects_technologies", dependent: :destroy, on_delete: :cascade

  def index
    {
      id: self.id,
      title: self.title,
      codemonkey: self.codemonkey.username,
      company: self.company.username,
      technologies: self.technologies.map { |technology| technology.index },
      description: self.description,
      status: self.status,
      suggestion_time: self.suggestion_time,
      start_time: self.start_time,
      end_time: self.end_time,
      rating: self.rating,
      comment: self.comment,
    }
  end
end

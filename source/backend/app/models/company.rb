class Company < User
  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :technologies, join_table: "technologies_users", foreign_key: "user_id", association_foreign_key: "technology_id", dependent: :destroy

  def new_project(title:, codemonkey:, technologies: [], description: "")
    suggestion_time = Time.now
    start_time = nil
    end_time = nil
    rating = nil
    comment = nil
    project = Project.new(title: title, codemonkey: codemonkey, company: self, technologies: technologies, description: description, suggestion_time: suggestion_time, start_time: start_time, end_time: end_time, rating: rating, comment: comment)
    project
  end

  def edit_project(project:, new_codemonkey:, new_technologies: [], new_description: "")
    if project.company != self
      raise "Company does not own project"
    end

    if project.start_time != nil
      raise "Project has already started"
    end

    if project.end_time != nil
      raise "Project has already ended"
    end

    project.codemonkey = new_codemonkey if new_codemonkey
    project.technologies = new_technologies if new_technologies
    project.description = new_description if new_description
    project
  end

  def terminate_project(project:, rating:, comment:)
    if project.company != self
      raise "Company does not own project"
    end

    if project.start_time == nil
      raise "Project has not started"
    end

    if project.end_time != nil
      raise "Project has already ended"
    end

    project.end_time = Time.now
    project.rating = rating
    project.comment = comment
    project
  end

  def change_name(new_name:)
    self.name = new_name
  end
end

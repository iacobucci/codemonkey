class Company < User
  has_many :projects, dependent: :delete_all
  has_and_belongs_to_many :technologies, join_table: "technologies_users", foreign_key: "user_id", association_foreign_key: "technology_id"

  def new_project(title:, codemonkey:, technologies: [], description: "")
    suggestion_time = Time.now
    start_time = nil
    end_time = nil
    rating = nil
    comment = nil
    project = Project.new(title: title, codemonkey: codemonkey, company: self, technologies: technologies, description: description, suggestion_time: suggestion_time, start_time: start_time, end_time: end_time, rating: rating, comment: comment)
    project.save
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
    project.save
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
    project.save
  end

  def settings(new_name:, new_bio:, new_email:, new_technologies:)
    self.name = new_name if new_name
    self.bio = new_bio if new_bio
    self.email = new_email if new_email
    self.technologies = new_technologies if new_technologies
    self.save
  end
end

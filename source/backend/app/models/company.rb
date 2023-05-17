class Company < User
  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :technologies, join_table: "technologies_users", foreign_key: "user_id", association_foreign_key: "technology_id", dependent: :destroy

  def index
    {
      username: self.username,
      type: self.type,
      email: self.email,
      name: self.name,
      bio: self.bio,
      technologies: self.technologies.map { |technology| technology.index },
    }
  end

  def change_name(new_name:)
    self.name = new_name
  end

  def change_bio(new_bio:)
    self.bio = new_bio
  end

  def change_technologies(new_technologies:)
    for technology in new_technologies
      if not technology.approved
        raise "Technology not approved"
      end
      if technology.rejected
        raise "Technology rejected"
      end
    end

    self.technologies = new_technologies
  end

  def new_project(title:, codemonkey:, technologies: [], description: "")
    if codemonkey.type != "Codemonkey"
      raise "User is not a codemonkey"
    end
    suggestion_time = Time.now
    start_time = nil
    end_time = nil
    rating = nil
    comment = nil
    status = "suggested"
    project = Project.new(title: title, codemonkey: codemonkey, company: self, technologies: technologies, description: description, suggestion_time: suggestion_time, start_time: start_time, end_time: end_time, rating: rating, comment: comment, status: status)
    project
  end

  def edit_project(project:, new_title: nil, new_codemonkey: nil, new_technologies: nil, new_description: nil)
    if project.company != self
      raise "Company does not own project"
    end

    if project.start_time != nil
      raise "Project has already started"
    end

    if project.end_time != nil
      raise "Project has already ended"
    end

    project.title = new_title unless new_title.nil?
    project.codemonkey = new_codemonkey unless new_codemonkey.nil?
    project.technologies = new_technologies unless new_technologies.nil?
    project.description = new_description unless new_description.nil?
    project
  end

  def terminate_project(project:, rating:, comment: nil)
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
    project.comment = comment unless comment.nil?
    project.status = "terminated"
    project
  end
end

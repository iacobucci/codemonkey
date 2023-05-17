class Codemonkey < User
  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :technologies, join_table: "technologies_users", foreign_key: "user_id", association_foreign_key: "technology_id", dependent: :destroy

  #actions

  def index
    {
      username: self.username,
      type: self.type,
      email: self.email,
      first_name: self.first_name,
      last_name: self.last_name,
      bio: self.bio,
      technologies: self.technologies.map { |technology| technology.index },
      rating: self.rating,
    }
  end

  def change_first_name(new_first_name:)
    self.first_name = new_first_name
  end

  def change_last_name(new_last_name:)
    self.last_name = new_last_name
  end

  def update_rating
    ratings = self.projects.map { |project| project.rating }.compact
    return nil if ratings.length == 0
    self.rating = ratings.reduce(:+) / ratings.length
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

  def accept_project(project:)
    if project.codemonkey != self
      raise "Codemonkey does not own project"
    end

    if project.start_time != nil
      raise "Project has already started"
    end

    if project.end_time != nil
      raise "Project has already ended"
    end

    project.start_time = Time.now
    project.status = "accepted"
    project
  end

  def reject_project(project:)
    if project.codemonkey != self
      raise "Codemonkey does not own project"
    end

    if project.start_time != nil
      raise "Project has already started"
    end

    if project.end_time != nil
      raise "Project has already ended"
    end

    project.status = "rejected"
    project
  end

  def interrupt_project(project:, comment: nil)
    if project.codemonkey != self
      raise "Codemonkey does not own project"
    end

    if project.start_time == nil
      raise "Project has not started"
    end

    if project.end_time != nil
      raise "Project has already ended"
    end

    project.end_time = Time.now
    project.comment = comment unless comment.nil?
    project.status = "interrupted"
    project
  end
end

class Codemonkey < User
  has_many :projects, dependent: :delete_all
  has_and_belongs_to_many :technologies, join_table: "technologies_users", foreign_key: "user_id", association_foreign_key: "technology_id", dependent: :destroy

  #actions

  def card
    {
      username: self.username,
      type: self.type,
      email: self.email,
      first_name: self.first_name,
      last_name: self.last_name,
      bio: self.bio,
      technologies: self.technologies.map { |technology| technology.card },
      rating: self.rating,
    }
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
end

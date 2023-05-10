class Codemonkey < User
  has_many :projects, dependent: :delete_all
  has_and_belongs_to_many :technologies, join_table: "technologies_users", foreign_key: "user_id", association_foreign_key: "technology_id"

  #actions

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
    project.save
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

    project.destroy
  end

  def settings(new_first_name:, new_last_name:, new_bio:, new_email:, new_technologies:)
    self.first_name = new_first_name if new_first_name
    self.last_name = new_last_name if new_last_name
    self.bio = new_bio if new_bio
    self.email = new_email if new_email
    self.technologies = new_technologies if new_technologies
    self.save
  end
end

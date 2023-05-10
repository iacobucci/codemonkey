class Technology < ApplicationRecord
  has_and_belongs_to_many :users, join_table: "technologies_users"
  has_and_belongs_to_many :projects, join_table: "projects_technologies"

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-z0-9]+\z/, message: "Invalid format" }

  #actions

  def self.suggest(name:)
    Technology.new(name: name, suggestion_time: Time.now, approved: false, rejected: false).save
  end

  def approve()
    if self.approved
      raise "Technology already approved"
    end

    if self.rejected
      raise "Technology already rejected"
    end

    self.approved = true
    self.save
  end

  def reject()
    if self.approved
      raise "Technology already approved"
    end

    if self.rejected
      raise "Technology already rejected"
    end

    self.rejected = true
    technology.save
  end

  def self.approved
    Technology.where(approved: true)
  end

  def self.unapproved
    Technology.where(approved: false, rejected: false)
  end
end

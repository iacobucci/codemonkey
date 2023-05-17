class Action < ApplicationRecord
  belongs_to :user

  def index
    {
      id: id,
      user: user.username,
      name: name,
      description: description,
      time: time,
    }
  end
end

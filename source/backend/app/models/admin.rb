class Admin < User
  def ban(user, status)
    if user.type == "Admin"
      raise "Invalid user"
    end

    if ["active", "suspended", "limited", "banned"].exclude? status
      raise "Status not valid"
    end

    user.status = status
  end
end

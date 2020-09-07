class PrayerPolicy < ApplicationPolicy
  # can only edit, update, destroy if user is present (logged in) and user is the prayer's user
  def update?
    user.present? and (user == record.user)
  end

  def edit?
    user.present? and (user == record.user)
  end

  def destroy?
    user.present? and (user == record.user)
  end

  # Check for user present and whether prayer is private. Also, need to check if the user that creates the prayer is anonymous or not (record.user != nil).
  # If prayer is from actual user, then allow show (user == record.user)
  def show?
    (user.present? and (record.private? ? user.friends_with?(record.user) : true)) or (user == record.user)
  end
end

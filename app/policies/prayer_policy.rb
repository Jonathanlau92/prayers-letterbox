class PrayerPolicy < ApplicationPolicy
  # can only edit, update and destroy if user is present (logged in) and user is the prayer's user
  def update?
    user.present? and (user == record.user)
  end

  def edit?
    user.present? and (user == record.user)
  end

  def destroy?
    user.present? and (user == record.user)
  end
end
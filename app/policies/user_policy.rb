class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.try(:admin?)
  end

end

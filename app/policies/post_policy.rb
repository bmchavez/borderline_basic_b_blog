class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    check_if_published
  end

  def create?
    user.admin
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.try(:admin?)
  end

  def check_if_published
    if record.draft?
      return false
    else
      return true
    end
  end

end

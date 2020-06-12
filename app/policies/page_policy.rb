class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard
    user_is_admin?
  end

  private

  def user_is_admin?
    user.try(:admin?)
  end


end

class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def newest_post?
    return true
  end

  # private

  # def user_is_admin?
  #   user.try(:admin?)
  # end
  
end

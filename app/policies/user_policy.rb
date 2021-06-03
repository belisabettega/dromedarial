class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    user.role == 'artist'
  end

  def purchases?
    true
  end
end

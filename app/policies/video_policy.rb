class VideoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    is_artist?
  end

  def change_status?
    is_artist?
  end

  def purchases?
    true
  end

  def dashboard?
    true
  end

  def review?
    set_review?
  end

  def set_review?
    record.user == user
  end

  private

  def is_artist?
    user.role == 'artist' && user == record.category.user
    # record.where(category_id: user.category_ids)
  end
end

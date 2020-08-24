class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # Only restaurant owners can update it
    record.user == user
  end

  def create?
    # Any logged-in user can create a Resto
    !user.nil?
  end

  def destroy?
    update?
  end
end

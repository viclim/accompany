class UserPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:boss)
        scope.all
      elsif user.role?(:head)
        scope.where(department_id: user.department_id)
      else
        scope.where(id: user.id)
      end
    end
  end

  def initialize(user, item)

  end

  def create?
  end

  def update?
  end

  def destroy?

  end
end

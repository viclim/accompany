class UserPolicy < ApplicationPolicy
  attr_reader :user, :item

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.role?(:boss) || user.department.try(:name) == 'HR'
        scope.all
      elsif user.role?(:head)
        scope.where(department_id: user.department_id)
      else
        scope.where(id: user.id)
      end
    end
  end

  def initialize(user, item)
    @user = user
    @item = item
  end

  def create?
    modify?
  end

  def update?
    modify?
  end

  def destroy?
    modify?
  end

  private

  def modify?
    user.role?(:boss) ||
      user.hr? ||
      (user.role?(:head) && user.department == item.department)
  end
end

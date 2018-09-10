# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    create?
  end

  def destroy?
    update?
  end
end

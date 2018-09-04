# frozen_string_literal: true

class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.present?
  end

  def show?
    index?
  end

  def create?
    true
  end

  def destroy?
    show?
  end
end

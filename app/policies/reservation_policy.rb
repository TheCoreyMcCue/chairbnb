class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end


end

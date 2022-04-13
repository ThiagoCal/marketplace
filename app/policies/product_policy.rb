class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
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

    def new?
      is_admin?
    end

    def create?
      is_admin?
    end

    def edit?
      is_admin?
    end

    def update?
      is_admin?
    end

    def destroy?
      is_admin?
    end

    def import?
      is_admin?
    end

    private

    def is_admin?
      @user.admin
    end
end

class StoreDetailPolicy < ApplicationPolicy
 class Scope < Scope
    def resolve
        scope.order(store_name: :asc)
    end
 end

  def index?
    true
  end

  def show?
    scope.where(:id => store_detail.id).exists?
  end

  def create?
    user.try(:admin?)||user.try(:owner?)
  end

  def new?
    create?
  end

  def update?
    (self.present? && user == store_detail.member) || user.try(:admin?)
  end

  def edit?
    update?
  end

  def destroy?
    (self.present? && user == store_detail.member) || user.try(:admin?)
  end


  private

    def store_detail
      record
    end
  
end
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
    user.try(:admin?)
  end

  def new?
    create?
  end

  def update?
  user.try(:admin?) || store_detail.member == user
  
  end

  def edit?
    update?
  end

  def destroy?
    user.try(:admin?) ||  store_detail.member == user
  end

  private

    def store_detail
      record
    end
  
end
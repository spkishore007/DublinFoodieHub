class ProductPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end
    
  def index?
      true
  end

  def show?
   scope.where(:id => product.id).exists?
  end

  def create?
    user.try(:admin?)||user.try(:owner?)
  end

  def new?
    create?
  end

  def update
  user.try(:admin?) || user.established_stores.ids.to_a.include?(product.store_detail_id)
  end

  def edit?
  user.try(:admin?) || user.established_stores.ids.to_a.include?(product.store_detail_id)
  end

  def destroy?
    user.try(:admin?) || user.established_stores.ids.to_a.include?(product.store_detail_id)
  end


    def product
      record
    end
end

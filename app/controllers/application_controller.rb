class ApplicationController < ActionController::Base
  before_action :category

  private

  def category
    @parents = Category.where(ancestry: nil)  
  end
  
end

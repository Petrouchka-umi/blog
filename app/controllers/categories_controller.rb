class CategoriesController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
  end

  def parent
    @category = Category.find(params[:id])
  end
end

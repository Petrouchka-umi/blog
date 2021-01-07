class CategoriesController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
  end

  def parent
    category = Category.find(params[:id])
    @category = category.name
    @parent = category.blogs.page(params[:page]).per(10).order("created_at DESC")
  end
end

class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to category_path category
    else
      redirect_to new_category_path
    end
  end

  def index
    @categories= Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category.udpate(category_params)

    
  end

  def destroy
    @category.destroy
    
    redirect_to 
  end
end
class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]
  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to category_path(category)
    else
      redirect_to new_category_path
    end
  end

  def show
  end

  def index
    @categories= Category.all
  end

  def edit
  end

  def update
    @category.udpate(category_params)

    redirect_to category(@category)
  end

  def destroy
    @category.destroy
    
    redirect_to categories_path
  end
  
  private 

  def category_params
    params.require(:article).permit(:title, :body)
  end

  def set_category
    @article = Article.find(params[:id])
  end

end

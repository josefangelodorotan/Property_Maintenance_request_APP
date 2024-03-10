class CategoriesController < ApplicationController
  #kakalagay ko to
  before_action :authenticate_user!


  # def index
  #   @categories = Category.all
  # end

  def index
    @categories = current_user.categories
    @todays_tasks = Task.where(schedule_date: Date.today)
  end



  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end


  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      # Redirect to the categories index with a success message
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      # Render the 'new' form again so the user can fix problems
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end

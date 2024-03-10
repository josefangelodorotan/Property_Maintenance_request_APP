class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @task = @category.tasks.build
  end

  def show

  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to @category, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @category, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to @category, notice: 'Task was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  # def task_params
  #   params.require(:task).permit(:title, :description, :category_id)
  # end

  def task_params
    params.require(:task).permit(:title, :description, :schedule_date, :completed, :category_id)
  end



end

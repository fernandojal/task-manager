class TasksController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save

    redirect_to tasks_path(@tasks)
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to tasks_path(@tasks)
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_restaurant
    @task = Task.find(params[:id])
  end
end
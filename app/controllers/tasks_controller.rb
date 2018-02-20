class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(clean_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(clean_params)
    redirect_to task_path(@task)
  end

  def destroy
    puts "Hello from the destroy function"
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def clean_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

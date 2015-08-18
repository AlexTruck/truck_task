class TasksController < ApplicationController
  before_action :get_task, except: [:new, :create]
  before_action :get_task_to_complete, only: [:complete, :incomplete]

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.create(task_params)
    redirect_to root_path
  end

  def update
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  def complete
    @task.completed = true
    @task.save
    redirect_to root_path
  end

  def incomplete
    @task.completed = false
    @task.save
    redirect_to root_path
  end

  private

  def get_task
    @task = Task.find(params[:id])
  end

  def get_task_to_complete
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :due_date, :completed)
  end
end
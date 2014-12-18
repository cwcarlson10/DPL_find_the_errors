class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      # Deleted the s from task so that the before action would recognise the method
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:priority, :description)
    end
end

# I fixed this by typing @task in to the better errors console 
    # and it came up as nil so I looked in the controller to find 
    # that the it was definded as @task instead of @tasks in the index method

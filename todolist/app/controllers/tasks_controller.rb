class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Airport created. Ok"
      redirect_to airports_path
    else
      @cities = City.all
      render 'new'
    end
  end

  def delete
  end



  private

  def task_params
    params.require(:task).permit(:name, :finish_date, :description, :priority)
  end


end

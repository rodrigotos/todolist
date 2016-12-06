class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    #@users = User.all()
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      @task.users << current_user
      if @task.save
        flash[:success] = "Task created. Ok"
        redirect_to tasks_path
      end
    else
      render 'new'
    end
  end

  def edit
      @task = Task.find_by(id: params[:id])
    if @task.nil?
      flash[:error] = "Houston we are in troubles, please dont hack us."
      redirect_to root_path
    end
  end


  def destroy
    @tasks = UserTask.find_by(task_id: params[:id])
  #  if @

  #  end
    if @task.destroy
      flash[:success] = "Task Destroyed Successfully"
    else
      flash[:error] = "Houston we are in troubles, please try it later"
    end
    redirect_to tasks_path
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      flash[:success] = "Task updated. Ok"
      redirect_to tasks_path
    else
      flash[:error] = "Houston we are in troubles, try it again."
      render 'edit'
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
     flash[:error] = "Houston we are in troubles, please dont hack us."
     redirect_to root_path
    end
  end
  private

  def task_params
    params.require(:task).permit(:name, :finish_date, :description, :priority)
  end


end

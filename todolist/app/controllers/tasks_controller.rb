class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks
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
    @user_tasks_count = UserTask.where(task_id: params[:id]).count
    if @user_tasks_count > 1
      # Elimino sólo la relación
      @user_task = UserTask.where(task_id: params[:id]).where(:user_id => current_user).first
      if @user_task.destroy
        flash[:success] = "Yoy don`t have already this task"
      else
        flash[:error] = "Houston we are in troubles, please try it later"
      end
    else
      # Elimino la relación y la tarea
      @user_task = UserTask.where(task_id: params[:id]).where(:user_id => current_user).first
      if @user_task.destroy
        @task = Task.find_by(id: params[:id])
        if @task.destroy
          flash[:success] = "Yoy don`t have already this task"
        else
          flash[:error] = "Houston we are in troubles, please try it later"
        end
      else
        flash[:error] = "Houston we are in troubles, please try it later"
      end
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

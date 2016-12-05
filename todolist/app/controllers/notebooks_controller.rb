class NotebooksController < ApplicationController

    def index
      @notebooks = Notebook.all
    end

    def new
      @notebooks = Notebook.new
    end

    def edit
      find_notebook
      if @notebooks.nil?
        flash[:error] = "Houston we are in troubles, please dont hack us."
        redirect_to root_path
      end
    end

    def create
      @notebooks = Notebook.new(notebook_params)
      @notebooks.user=current_user
      if @notebooks.save
        redirect_to notebooks_path
      else
        flash[:success] = "Notebook created. Ok"
        render 'new'
      end
    end

    def destroy
      find_notebook
      if @notebooks.destroy
        flash[:success] = "Notebook Destroyed Successfully"
      else
        flash[:error] = "Houston we are in troubles, please try it later"
      end
      redirect_to notebooks_path
    end

    def update
      find_notebook
      if @notebooks.update(notebook_params)
        flash[:success] = "Notebooks updated. Ok"
        redirect_to notebooks_path
      else
        flash[:error] = "Houston we are in troubles, try it again."
        render 'edit'
      end
    end


  def show
   find_notebook
   if @notebooks.nil?
     flash[:error] = "Houston we are in troubles, please dont hack us."
     redirect_to root_path
   end
  end
    private

    def find_notebook
      @notebooks = Notebook.find_by(id: params[:id])
    end

    #strong parameters
    def notebook_params
      params.require(:notebook).permit(:name)
    end

  end

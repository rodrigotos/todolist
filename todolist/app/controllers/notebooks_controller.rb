class NotebooksController < ApplicationController

    def index
      @notebooks = Notebook.all
    end

    def new
      @notebooks = Notebook.new
    end

    def edit
      find_airline
      if @notebooks.nil?
        flash[:error] = "Houston we are in troubles, please dont hack us."
        redirect_to root_path
      end
    end

    def create
      @notebooks = Notebook.new(notebook_params)
      if @notebooks.save
        redirect_to notebooks_path
      else
        flash[:success] = "Notebook created. Ok"
        render 'new'
      end
    end

    def destroy
      find_airline
      if @notebooks.destroy
        flash[:success] = "Airline Destroyed Successfully"
      else
        flash[:error] = "Houston we are in troubles, please try it later"
      end
      redirect_to airlines_path
    end

    def update
      find_airline
      if @notebooks.update(notebook_params)
        flash[:success] = "Airline updated. Ok"
        redirect_to airlines_path
      else
        flash[:error] = "Houston we are in troubles, try it again."
        render 'edit'
      end
    end


    def show
      find_airline
      if @notebooks.nil?
        flash[:error] = "Houston we are in troubles, please dont hack us."
        redirect_to root_path
      end
    end





    private

    def find_airline
      @notebooks = Notebook.find_by(id: params[:id])
    end

    #strong parameters
    def notebook_params
      params.require(:notebook).permit(:name)
    end


  end

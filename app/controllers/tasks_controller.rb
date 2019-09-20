class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(tasks_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@list)
  end

  def index
    @list = List.find(params[:list_id])
    @task = @list.tasks.all
    respond_to do |format|
      format.html
      format.csv { send_data @task.to_csv, filename: "List-#{@list.name}.csv" }
    end
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.(comment_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  private
    def tasks_params
      params.require(:task).permit(:title, :content)
    end
end

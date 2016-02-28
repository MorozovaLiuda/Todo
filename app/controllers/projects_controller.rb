class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :prepare_task_form, only: [:index, :new]
  respond_to :html, :js
 
  def index

    @projects = Project.all
   
  end

  
  def show
    
  end

  
  def new
    @project = Project.new
  end

  
  def edit
  end

  
  
  def create
    @project = Project.new(project_params)
    @project.save
        
  end

  
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @project}
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def prepare_task_form
      @task= Task.new
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, tasks_attributes: [:name, :project_id])
    end
end
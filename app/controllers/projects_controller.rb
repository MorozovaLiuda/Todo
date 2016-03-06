class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def create
    @project = Project.create(project_params)

  end

  def edit
  end

  def update
    @project.update(project_params)
  end

  def destroy
    @project.destroy
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end




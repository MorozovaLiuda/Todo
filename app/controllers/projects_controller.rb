class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def create
    @project = Project.create(project_params)
  end

  def edit
    @project = find_project_by_id
  end

  def update
    @project = find_project_by_id
    @project.update(project_params)
  end

  def destroy
    @project = find_project_by_id.destroy
  end

  private

  def find_project_by_id
    Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end

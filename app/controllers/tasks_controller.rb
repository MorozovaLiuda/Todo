class TasksController < ApplicationController
	before_action :set_project
	before_action :set_task, except: [:create]
  respond_to :html, :js
	
	def new
		@task = Task.new
	end	

	def create
		@task = @project.tasks.build(task_params)
		redirect_to @project
	end

	def destroy
		if @task.destroy
			flash[:success] = "Todo List item was deleted succesfullly."
		else
			flash[:error] = "Todo List item could not be deleted."
		end
		redirect_to @project
	end


	private

	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_task
		@task = @project.tasks.find(params[:id])
	end

	def task_params
		 params.require(:task).permit(:name, :project_id)
	end
end
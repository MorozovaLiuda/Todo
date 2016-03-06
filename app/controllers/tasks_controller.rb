class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]

	def create
		@task = Task.create(task_params)
	end

	def edit
  end

  def update
    @task.update(task_params)
  end

	def destroy
    @task.destroy
  end

	private

	def find_task
		@task = Task.find(params[:id])
	end

	def task_params
		 params.require(:task).permit(:name, :project_id)
	end
end

class TasksController < ApplicationController
  def create
    @task = Task.create(task_params)
  end

  def edit
    @task = find_task_by_id
  end

  def update
    @task = find_task_by_id
    @task.update(task_params)
  end

  def destroy
    @task = find_task_by_id.destroy
  end

  private

  def find_task_by_id
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :project_id)
  end
end

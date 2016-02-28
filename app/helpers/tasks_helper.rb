module TasksHelper
  def already_done(task)
    'already_done' if task.status
  end
end

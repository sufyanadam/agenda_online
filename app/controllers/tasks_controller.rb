class TasksController < ApplicationController
  DEFAULT_TODO_FILE = '/org/todo.org'

  def capture

  end

  def create
  end

  def index
    dropbox_client = get_dropbox_client
    @todo_file = dropbox_client.get_file(DEFAULT_TODO_FILE)
  end
end

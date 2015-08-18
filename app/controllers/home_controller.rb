class HomeController < ApplicationController
  def index
    @tasks = Task.where("user_id >= ?", current_user.id)
  end
end

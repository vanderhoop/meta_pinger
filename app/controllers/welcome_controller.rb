class WelcomeController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index
    @app = App.new
  end

  def success
    munged_title = params[:munged_title]
    @url = App.find_by_project_name(munged_title).url
  end

end

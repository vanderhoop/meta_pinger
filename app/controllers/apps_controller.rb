class AppsController < ApplicationController

  def create
    @app = App.create(params["app"])
  end

end

class AppsController < ApplicationController

  def create
    redirect_to '/' if App.create(params["app"])
    flash[:notice] = "Your app shall never idle. Love, Travis."
  end

end

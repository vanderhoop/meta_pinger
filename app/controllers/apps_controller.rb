class AppsController < ApplicationController

  def create
    if params["app"]["url"].slice(-13,13) == "herokuapp.com"
      redirect_to '/' if App.create(params["app"])
      flash[:notice] = "Your app shall never idle. Love, Travis."
    else
      flash[:error] = "You supplied an unworthy URL. Try a Heroku App."
      redirect_to '/'
    end
  end

end

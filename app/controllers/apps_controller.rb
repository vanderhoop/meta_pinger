class AppsController < ApplicationController

  def create
    app = App.new(url: params["app"]["url"])

    if app.project_name? && app.exists? && app.save
      redirect_to "/success/#{app.project_name}"
    else
      errors         = app.errors.messages
      flash[:error]  = errors[:url_invalid].first if errors[:url_invalid]
      flash[:notice] = "Hmmm... looks like MetaPinger is already pinging this app, so rest easy." if errors[:project_name] && errors[:project_name].include?("has already been taken")
      redirect_to "/" and return
    end
  end

end

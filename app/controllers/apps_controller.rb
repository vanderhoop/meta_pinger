class AppsController < ApplicationController

  def create
    heroku_url = validate_submitted_url(params["app"]["url"])

    if heroku_url
      url_tail = prepare_url_for_request(heroku_url)
      response = HTTParty.get("http://" + url_tail)
      if response.include?("No such app")
        flash[:error] = "ERROR: Heroku says there's no app at this location. Maybe check for typos and resubmit."
        redirect_to '/' and return
      end

      app = App.new(url: url_tail, project_name: heroku_url[3].parameterize)
      if app.save
        redirect_to "/success/#{app.project_name}"
      elsif app.errors.full_messages.include?("Url has already been taken")
        flash[:notice] = "Hmmm... looks like MetaPinger is already pinging this app, so rest easy."
        redirect_to '/' and return
      end
    else
      flash[:error] = "ERROR: It seems you supplied an unworthy URL. Make sure the URL ends in 'herokuapp.com.'"
      redirect_to '/' and return
    end
  end
end

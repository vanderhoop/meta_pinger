class AppsController < ApplicationController

  def create
    # grabs the url
    submitted_url = params["app"]["url"]
    valid_heroku_url = validate_submitted_url(submitted_url)

    if !valid_heroku_url
      flash[:error] = "ERROR: It seems you supplied an unworthy URL. Make sure the URL ends in 'herokuapp.com.'"
      redirect_to '/'
    else
      url_tail = prepare_url_for_request(valid_heroku_url)
      response = HTTParty.get("http://" + url_tail)
      if response.include?("No such app")
        flash[:error] = "ERROR: Heroku says there's no app at this location. Maybe check for typos and resubmit."
        redirect_to '/'
      end

      app = App.new(params["app"])
      if app.save
        redirect_to '/success'
      elsif app.errors.full_messages.include?("Url has already been taken")
        flash[:notice] = "Hmmm... looks like MetaPinger is already pinging this app, so rest easy."
        redirect_to '/'
      end
    end
  end
end

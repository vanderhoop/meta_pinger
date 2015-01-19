class AppsController < ApplicationController

  def create
    # heroku_url_match_object = validate_submitted_url(params["app"]["url"])

    # if !heroku_url_match_object
    #   flash[:error] = "ERROR: It seems you supplied an unworthy URL. Make sure the URL ends in 'herokuapp.com.'"
    #   redirect_to "/" and return
    # else
    #   url_to_ping = prepare_url_for_request(heroku_url_match_object)
    #   response    = HTTParty.get(url_to_ping)
    #   if response.include?("No such app") || response.include?("page may have moved")
    #     flash[:error] = "ERROR: Heroku says there's no app at this location. Maybe check for typos and resubmit."
    #     redirect_to "/" and return
    #   end

    # app = App.new(url: params["app"]["url"], project_name: heroku_url_match_object[3].parameterize)
    app = App.new(url: params["app"]["url"])
    if app.save
      redirect_to "/success/#{app.project_name}"
    elsif app.errors.full_messages.include?("Url has already been taken")
      flash[:notice] = "Hmmm... looks like MetaPinger is already pinging this app, so rest easy."
      redirect_to "/" and return
    end
    # end
  end

  def validate_submitted_url(submitted_url)
    pattern = /^(https?:\/\/)?(w{3}\.)?(\S+)(\.herokuapp\.com)\/?$/i
    pattern.match(submitted_url.strip)
  end

  def prepare_url_for_request(regex)
    "http://" + regex[3] + regex[4]
  end
end

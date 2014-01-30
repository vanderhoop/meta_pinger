class AppsController < ApplicationController

  def create
    submitted_url = params["app"]["url"]
    submitted_url = submitted_url[0..-2] if submitted_url.last == "/"
    response = HTTParty.get("http://" + submitted_url)
    error = response.include?("No such app") ? "Heroku says there's no app at this location. Maybe check for typos." : "No error here"

    # If the supplied URL has a forward slash appended,
    # I chop it off
    ending_string = params["app"]["url"].slice(-13,13)
    if params["app"]["url"].slice(-13,13) == "herokuapp.com"
      redirect_to '/' if App.create(params["app"])
      flash[:notice] = "Your app shall never idle. Love, Travis."
    else
      flash[:error] = "You supplied an unworthy URL. Make sure the URL ends in herokuapp.com."
      redirect_to '/'
    end
  end

end

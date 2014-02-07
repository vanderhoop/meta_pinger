class AppsController < ApplicationController

  def create
    # grabs the url
    submitted_url = params["app"]["url"]
    # handles cases where users include 'http://'' or 'http://www.'
    submitted_url.gsub!('http://www.', '')
    submitted_url.gsub!('http://', '')
    # chops off unecessary trailing forward slash
    submitted_url = submitted_url[0..-2] if submitted_url.last == "/"
    ending_string = submitted_url.slice(-13,13)

    if ending_string == "herokuapp.com"
      response = HTTParty.get("http://" + submitted_url)
      if response.include?("No such app")
        flash[:error] = "ERROR: Heroku says there's no app at this location. Maybe check for typos and resubmit."
        redirect_to '/'
      else
        redirect_to '/success' if App.create(params["app"])
      end
    else
      flash[:error] = "ERROR: It seems you supplied an unworthy URL. Make sure the URL ends in 'herokuapp.com.'"
      redirect_to '/'
    end # if ending_string == "herokuapp.com"

  end # create
end

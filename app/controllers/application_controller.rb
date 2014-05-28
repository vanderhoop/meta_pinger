class ApplicationController < ActionController::Base
  protect_from_forgery
  def validate_submitted_url(submitted_url)
    regex_match = /^(https?:\/\/)?(w{3}\.)?(\S+)(\.herokuapp\.com)\/?$/i.match(submitted_url)
  end

  def prepare_url_for_request(regex)
    regex[3] + regex[4]
  end
end

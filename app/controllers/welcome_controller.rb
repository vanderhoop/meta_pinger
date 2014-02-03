class WelcomeController < ApplicationController
  respond_to :json #sets all actions to respond to .json requests

  def index
    @app = App.new
  end

  def success
    @url = App.last.url || "MarpDarp"
  end

end

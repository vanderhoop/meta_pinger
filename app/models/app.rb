class App < ActiveRecord::Base
  attr_accessible :url, :project_name
  # after_create :ping_app

  # def ping_app
  #   url = self.url
  #   response = HTTParty.get(url)
  #   sleep(20.minute)
  #   ping_app
  # end
end



class App < ActiveRecord::Base
  attr_accessible :url, :project_name

  validates :url, :project_name, { :uniqueness => true, :presence => true }

  before_save :format_url

  def format_url
    pattern = /^(https?:\/\/)?(w{3}\.)?(\S+)(\.herokuapp\.com)\/?$/i
    match   = pattern.match(self.url)
    throw Exceptions::InvalidHerokuURL if match.nil?
    self.url = "http://" + match[3] + match[4]
  end


end



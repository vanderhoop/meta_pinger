class App < ActiveRecord::Base
  attr_accessible :url, :project_name
  validates :url, uniqueness: true
  validates :project_name, uniqueness: true
end



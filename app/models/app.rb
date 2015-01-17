class App < ActiveRecord::Base
  attr_accessible :url, :project_name

  validates :url, {
    :uniqueness => true,
    :presence => true
  }

  validates :project_name, {
    :uniqueness => true,
    :presence => true
  }
end



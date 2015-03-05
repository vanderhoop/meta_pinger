class App < ActiveRecord::Base
  attr_accessible   :url, :project_name
  validates         :url, :project_name, { :uniqueness => true, :presence => true }

  after_initialize  :format_attributes
  after_save        :alert_admin

  def format_attributes
    match = /^(https?:\/\/)?(w{3}\.)?(\S+)(\.herokuapp\.com)\/?$/i.match(self.url)
    if !match
      errors.add(:url_invalid, "ERROR: It seems you supplied an unworthy URL. Make sure the URL ends in 'herokuapp.com'.")
    else
      self.project_name = $3.parameterize
      self.url          = "http://" + $3 + $4
    end
  end

  def exists?
    if self.url.include?("metapinger.herokuapp.com")
      errors.add(:url_invalid, "Clever, clever!")
    else
      response = HTTParty.get(self.url)
      if response.include?("No such app") || response.include?("page may have moved")
        errors.add(:url_invalid, "ERROR: Heroku says there's no app at this location. Maybe check for typos and resubmit.")
      end
      errors.messages.empty?
    end
  end

  def alert_admin
    AppMailer.alert_admin(self).deliver
  end

end



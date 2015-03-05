class AppMailer < ActionMailer::Base
  default from: "notifications@metapinger.herokuapp.com"

  def alert_admin(app)
    @app = app
    mail(to: "travis@yourfriendtravis.com", subject: "#{app.project_name} Submitted to MetaPinger")
  end

end

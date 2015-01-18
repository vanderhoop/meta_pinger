desc "This task is called by the Heroku scheduler add-on"
task :ping_apps => :environment do
  puts "Pinging apps..."
  App.all.each do |app|
    response = HTTParty.get(app.url)
  end
  puts "All apps have been pinged."
end

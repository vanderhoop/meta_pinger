desc "This task is called by the Heroku scheduler add-on"
task :ping_apps => :environment do
  utc_hour = Time.now.hour

  if (11..23).include?(utc_hour) || (0..1).include?(utc_hour)
    puts "Pinging apps..."
    App.find_each do |app|
      begin
        response = HTTParty.get(app.url)
        puts "Pinging #{app.url}"
      rescue Exception => e
        puts "#{app.url} went bust:\n\t#{e.message}"
      end
    end
    puts "Finished pinging."
  end
end

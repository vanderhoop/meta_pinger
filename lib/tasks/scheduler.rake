desc "This task is called by the Heroku scheduler add-on"
task :ping_apps => :environment do
  puts "Pinging apps..."
  App.all.each do |app|
    begin
      response = HTTParty.get(app.url)
    rescue SocketError => e
      puts "#{app.url} went bust:"
      puts e
    end
  end
  puts "Finished pinging."
end

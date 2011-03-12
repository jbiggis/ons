desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  #if Time.now.hour % 4 == 0 # run every four hours
  #  puts "Updating feed..."
  #  NewsFeed.update
  #  puts "done."
  #end

  if Time.now.hour == 0 # run at midnight

    targets = Target.find(:all, :conditions => 'matched_at IS NOT NULL and notified_at IS NULL')

    targets.each do |target|
      if Matchmailer.match_mail(target.hunter.email).deliver
	target.update_attributes(:notified_at => Time.now)
      else
	#log error?
      end
    end
  end
end

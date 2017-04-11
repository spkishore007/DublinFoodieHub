desc "This task is called by the Heroku scheduler add-on"
task :generate_sales => :environment do
  puts "Running sales table"
  Dsale.sales_deco_method
  puts "done."
end

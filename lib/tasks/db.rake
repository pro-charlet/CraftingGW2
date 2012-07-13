namespace :db do
  desc "Load seed fixtures (from db/fixtures) into the current environment's database." 
  task :seed => :environment do
    puts "Seed start !"
    require 'active_record/fixtures'
    Dir.glob('./db/fixtures/*.yml').each do |file|
      puts "File: " + file
      ActiveRecord::Fixtures.create_fixtures('db/fixtures', File.basename(file, '.*'))
    end
  end

  task :recipie => :environment do
    require 'active_record/fixtures'
    Dir.glob('./db/recipies/*.yml').each do |file|
      puts "File: " + file
      ActiveRecord::Fixtures.create_fixtures('db/recipies', File.basename(file, '.*'))
    end
  end
end
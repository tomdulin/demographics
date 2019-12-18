namespace :db do
  desc "PG Specific, db: terminate, drop, create, migrate, seed"
  task :wipe => :environment do
    Rake::Task["db:terminate"].invoke
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end

  task :test_wipe => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end


  desc "Fix 'database is being accessed by other users'"
  task :terminate => :environment do
    begin
      ActiveRecord::Base.connection.execute <<-SQL
        SELECT
          pg_terminate_backend(pid)
        FROM
          pg_stat_activity
        WHERE
          -- don't kill my own connection!
          pid <> pg_backend_pid()
          -- don't kill the connections to other databases
          AND datname = '#{ActiveRecord::Base.connection.current_database}';
      SQL
    rescue
      puts "db:terminate :: Could not terminate db connection."
    end
  end
end
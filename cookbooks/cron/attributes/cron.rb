# Add one hash per cron job required
# Set the utility instance name to install each cron job on via instance_name

default[:custom_crons] = [
  {
    :name => "Email and SMS alerts", 
    :time => "0 */1 * * *", 
    :command => "curl http://www.contexttravel.com/admin_cron/hourly", 
    :instance_name => "context_cron_job"
    }, 
    {
      :name => "Docent reminder emails", 
      :time => "0 8 */1 * *", 
      :command => "curl http://www.contexttravel.com/admin_cron/daily", 
      :instance_name => "context_cron_job"
     }, 
    {
        :name => "Update Exchange Rates", 
        :time => "0 7 */1 * *", 
        :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:update_exchange_rates", 
        :instance_name => "context_cron_job"
      }, 
      {
          :name => "Send post trip surveys", 
          :time => "0 1 */1 * *", 
          :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:send_post_trip_surveys", 
          :instance_name => "context_cron_job"
       }, 
       {
            :name => "Docent Block Date for Walk", 
            :time => "0 */2 * * *", 
            :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:save_update_docent_block_date", 
            :instance_name => "context_cron_job"
        },
        {
              :name => "Report First", 
              :time => "0 0 */1 * *", 
              :command => "cd /data/contexttravel/current && bundle exec rake sales_metrics:sales_metrics_for_city RAILS_ENV=production", 
              :instance_name => "context_cron_job"
         },

         {
                :name => "Report Second", 
                :time => "0 12 */1 * *", 
                :command => "cd /data/contexttravel/current && bundle exec rake sales_metrics:sales_metrics_for_city RAILS_ENV=production", 
                :instance_name => "context_cron_job"
         }, 
         
        {
               :name => "Email", 
               :time => "*/10 * * * *", 
               :command => "/usr/bin/lockrun --lockfile=/tmp/sync_flickr.lockrun -- sh -c  cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:fetch_and_catalog_all_client_emails", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "Expiry Check", 
               :time => "*/30 * * * *", 
               :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:expiry_check", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "Random Cleanup Half An Hourly", 
               :time => "*/30 * * * *", 
               :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:cleanup_old_random_string", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "Random Cleanup Hourly", 
               :time => "0 1 */7 * *", 
               :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:cleanup_old_random_string", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "First Assignment Mail", 
               :time => "*/30 * * * *", 
               :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:first_assignment_mail", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "Write To CDN", 
               :time => "*/45 * * * *", 
               :command => "/usr/bin/lockrun --lockfile=/tmp/sync_flickr.lockrun -- sh -c  cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake cdn:write_to_cdn", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "Create City Profitabilities", 
               :time => "* */8 * * *", 
               :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake profitabilities:create_or_update_city_profitabilities", 
               :instance_name => "context_cron_job"
        },
        {
               :name => "Reminder to Client", 
               :time => "0 */1 * * *", 
               :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:mail_to_client", 
               :instance_name => "context_cron_job"

        }

      ]

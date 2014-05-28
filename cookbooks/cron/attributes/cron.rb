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
              :time => "0 4 */1 * *", 
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
                 :command => "cd /data/contexttravel/current && RAILS_ENV=production bundle exec rake contexttravel:fetch_and_catalog_all_client_emails", 
                 :instance_name => "context_cron_job"
          }
      ]

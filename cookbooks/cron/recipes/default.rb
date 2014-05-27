#
# Cookbook Name:: cron
# Recipe:: default
#
raise
# Find all cron jobs specified in attributes/cron.rb where current node name matches instance_name
crons = node[:custom_crons].find_all
crons.each do |cron|
    if cron[:instance_name] == 'context_cron_job'
    user     'deploy'
    action   :create
    minute   cron[:time].split[0]
    hour     cron[:time].split[1]
    day      cron[:time].split[2]
    month    cron[:time].split[3]
    weekday  cron[:time].split[4]
    command  cron[:command] 
    end
end 


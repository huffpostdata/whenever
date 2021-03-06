require "whenever/capistrano/v2/recipes"

Capistrano::Configuration.instance(:must_exist).load do
  # Write the new cron jobs near the end.
  after "deploy:symlink", "whenever:update_crontab"
  # If anything goes wrong, undo.
  after "deploy:rollback", "whenever:update_crontab"
end

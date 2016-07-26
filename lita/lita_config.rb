Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = ENV["LITA_BOT_NAME"]

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = ENV["LITA_LOG_LEVEL"] || :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]
  config.robot.admins = ["${ENV[\"LITA_ADMIN\"]}"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :slack


  ## Example: Set options for the Redis connection.
   config.redis.host = ENV["LITA_REDIS_HOST"]
   config.redis.port = ENV["LITA_REDIS_PORT"]

  # Slack Adapter
  config.adapters.slack.token = ENV["LITA_SLACK_TOKEN"]

  # CMD Handler
  config.handlers.cmd.scripts_dir = ENV["LITA_CMD_SCRIPTS_DIR"] || "/home/bot/scripts/"

  # Lita CMD - optional parameters

  # Note that %s will contain the returned text
  config.handlers.cmd.output_format = "%s"

  # Set the prefix of stdout and stderr.
  config.handlers.cmd.stdout_prefix = ""
  config.handlers.cmd.stderr_prefix = "ERROR: "

  # Set the prefix for running scripts.
  config.handlers.cmd.command_prefix = "run "
end

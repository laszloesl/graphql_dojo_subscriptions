# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :graphql_dojo_subscriptions, ecto_repos: [GraphqlDojoSubscriptions.Repo]

config :graphql_dojo_subscriptions, GraphqlDojoSubscriptions.Repo,
  database: "graphql_dojo_subscriptions_repo",
  username: "docker",
  password: "docker",
  hostname: "localhost"

# Configures the endpoint
config :graphql_dojo_subscriptions, GraphqlDojoSubscriptionsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hMBM0ikWM4f/O6HTJxrO4Dr5SAA7IQByKJP/wYIPp/+dOJjWvoPMPHyUrtfYaNC4",
  render_errors: [view: GraphqlDojoSubscriptionsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GraphqlDojoSubscriptions.PubSub,
  live_view: [signing_salt: "lyX8h5PG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chirper,
  ecto_repos: [Chirper.Repo]

# Configures the endpoint
config :chirper, ChirperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gL9q7wK8xa6rOHKCftraA1bWMVaDEqkf4WJSrq9DzLiNEyQYF1AFwQ2xwZBy6rhD",
  render_errors: [view: ChirperWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chirper.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "rYZa8Ptf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

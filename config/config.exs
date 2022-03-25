# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :space_code_platform,
  ecto_repos: [SpaceCodePlatform.Repo]

# Configures the endpoint
config :space_code_platform, SpaceCodePlatformWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vOPwaxtqWpBu246AZqqgklgmVndAXyK4ybB3ziVw4cVwCXQ/OkmHXdJvmuLLHXVe",
  render_errors: [view: SpaceCodePlatformWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SpaceCodePlatform.PubSub,
  live_view: [signing_salt: "6SqMqtLg"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

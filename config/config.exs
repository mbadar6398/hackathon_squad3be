# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hackathon_squad3be,
  ecto_repos: [HackathonSquad3be.Repo]

# Configures the endpoint
config :hackathon_squad3be, HackathonSquad3beWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PnsGKx7gtDdxznCgu30wtMCNCs9LzT2wtzl1bWmy09w2GFhFXNJW3mQ2XOgyz2dr",
  render_errors: [view: HackathonSquad3beWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HackathonSquad3be.PubSub,
  live_view: [signing_salt: "g+gi6CDe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

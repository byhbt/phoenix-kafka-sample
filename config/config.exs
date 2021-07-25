# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixir_kafka,
  ecto_repos: [ElixirKafka.Repo]

# Configures the endpoint
config :elixir_kafka, ElixirKafkaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2avUQsuGYDQBDICSn/X6WB81rNC3LYp2g+263of3e9IMMgegDaZpKjQlAwXQGBI5",
  render_errors: [view: ElixirKafkaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirKafka.PubSub,
  live_view: [signing_salt: "Cpu/YqN6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :kaffe,
  producer: [
    endpoints: [localhost: 29092],
    topics: ["emails"],
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

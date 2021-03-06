# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config
import_config "#{Mix.env}.exs"
# General application configuration
config :volna_api,
  ecto_repos: [VolnaApi.Repo]

# Configures the endpoint
config :volna_api, VolnaApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q1RsoGm1Iwj5C2LNzA6mkgSA2J4CdtCrFtL7HxIoIbk7Wm/hOZrDz2FXBaWqLOsI",
  render_errors: [view: VolnaApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VolnaApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "VolnaApi",
  ttl: { 30, :days},
  verify_issuer: true,
  secret_key: "<your secret guardian key>",
  serializer: VolnaApi.GuardianSerializer
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.


# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :methedras,
  ecto_repos: [Methedras.Repo]

# Configures the endpoint
config :methedras, MethedrasWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rusi16mBuNQgrn/UrwOPNssCUALSxNRNy4zK720gOPuLkSaKFGWj4VjM97l6NMKG",
  render_errors: [view: MethedrasWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Methedras.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, []}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

config :methedras, MethedrasWeb.Guardian,
  issuer: "methedras",
  secret_key: "LzrREdVf23v1sinXTgXTfEwRx6AeuBmd9f8qdP4IIA2IeKXVz9K2IXB+PgL+NJKj"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


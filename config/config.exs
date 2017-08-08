# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :brandnew_mail_tracker,
  ecto_repos: [BrandnewMailTracker.Repo]

# Configures the endpoint
config :brandnew_mail_tracker, BrandnewMailTracker.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "raStd9A12ByJoPjGrX//jdfGeh76GhGTQpTWCt9ik2vMcVjJaJcfYLbOMX47qOlY",
  render_errors: [view: BrandnewMailTracker.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BrandnewMailTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sea_traders,
  ecto_repos: [SeaTraders.Repo]

# Configures the endpoint
config :sea_traders, SeaTradersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yCPPOagLj36KJo932mnFlMTmTUznfVcM9Lburhp6DOZN0d1ZcpM6+/rOHRo/8fK7",
  render_errors: [view: SeaTradersWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SeaTraders.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%
config :coherence,
  user_schema: SeaTraders.Coherence.User,
  repo: SeaTraders.Repo,
  module: SeaTraders,
  web_module: SeaTradersWeb,
  router: SeaTradersWeb.Router,
  messages_backend: SeaTradersWeb.Coherence.Messages,
  logged_out_url: "/",
  registration_permitted_attributes: ["email","name","password","current_password","password_confirmation"],
  invitation_permitted_attributes: ["name","email"],
  password_reset_permitted_attributes: ["reset_password_token","password","password_confirmation"],
  session_permitted_attributes: ["remember","email","password"],
  email_from_name: "Sea Traders Game",
  email_from_email: "sven.dittmer@gmx.net",
  opts: [:authenticatable, :recoverable, :lockable, :unlockable_with_token, :confirmable, :registerable, :invitable]
# %% End Coherence Configuration %%

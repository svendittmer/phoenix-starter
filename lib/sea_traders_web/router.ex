defmodule SeaTradersWeb.Router do
  use SeaTradersWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  if Mix.env == :dev do
    scope "/dev" do
      pipe_through [:browser]

      forward "/mailbox", Plug.Swoosh.MailboxPreview, [base_path: "/dev/mailbox"]
    end
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", SeaTradersWeb do
    pipe_through :browser
    get "/", PageController, :index
    # Add public routes below
  end

  scope "/", SeaTradersWeb do
    pipe_through :protected
    # Add protected routes below
    resources "/cities", CityController
    resources "/ships", ShipController
    put "/ships/:id/send", ShipController, :send
  end
end

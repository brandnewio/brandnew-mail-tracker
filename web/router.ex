defmodule BrandnewMailTracker.Router do
  use BrandnewMailTracker.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BrandnewMailTracker do
    pipe_through :api # Use the default browser stack

    resources "/", MailCategoryController, only: [:index, :show]
    scope "/sent_mails" do
      post "/", SentMailController, :create
      put "/open/:token", SentMailController, :open
      put "/click/:token", SentMailController, :click
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrandnewMailTracker do
  #   pipe_through :api
  # end
end

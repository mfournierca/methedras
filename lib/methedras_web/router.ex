defmodule MethedrasWeb.Router do
  use MethedrasWeb, :router

  alias MethedrasWeb.ChecklistController
  alias MethedrasWeb.ExecutionController
  alias MethedrasWeb.ExecutionAppController
  alias MethedrasWeb.ChecklistAppController

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

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession, module: MethedrasWeb.Guardian, error_handler: MethedrasWeb.AuthErrorHandler
    plug Guardian.Plug.LoadResource, module: MethedrasWeb.Guardian, error_handler: MethedrasWeb.AuthErrorHandler
  end

  scope "/", MethedrasWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/checklist" do
    pipe_through [:browser, :browser_auth]

    get "/", ChecklistAppController, :index
    get "/create", ChecklistAppController, :create
    get "/:id/", ChecklistAppController, :show
    get "/:id/edit", ChecklistAppController, :edit
    delete "/:id/delete", ChecklistAppController, :delete

    get "/:checklist_id/execute", ExecutionAppController, :create
  end

  scope "/execute" do
    pipe_through [:browser, :browser_auth]

    get "/", ExecutionAppController, :index
    get "/:id", ExecutionAppController, :show
  end

  scope "/api/v1/" do
    pipe_through [:api, :browser_auth] # All api requests come from the user's browser session

    resources "/checklist", ChecklistController
    resources "/execution", ExecutionController
  end

  scope "/auth", Methedras do
    pipe_through :browser

    get "/google", AuthController, :request
    get "/google/callback", AuthController, :callback
    post "/google/callback", AuthController, :callback
    get "/logout", AuthController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", MethedrasWeb do
  #   pipe_through :api
  # end
end

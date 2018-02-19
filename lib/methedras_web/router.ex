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

  scope "/", MethedrasWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/checklist" do
    pipe_through :browser

    get "/", ChecklistAppController, :index
    get "/create", ChecklistAppController, :create
    get "/:id/", ChecklistAppController, :show
    get "/:id/edit", ChecklistAppController, :edit
    delete "/:id/delete", ChecklistAppController, :delete

    get "/:checklist_id/execute", ExecutionAppController, :create
  end

  scope "/execute" do
    pipe_through :browser

    get "/", ExecutionAppController, :index
    get "/:id", ExecutionAppController, :show
  end

  scope "/api/v1/" do
    pipe_through :api

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

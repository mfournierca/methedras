defmodule MethedrasWeb.Router do
  use MethedrasWeb, :router
  alias MethedrasWeb.ChecklistController
  alias MethedrasWeb.ExecutionController
  alias MethedrasWeb.ExecutionAppController

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

  scope "/checklist", MethedrasWeb do
    pipe_through :browser

    get "/", PageController, :checklist_index
    get "/:id/edit", PageController, :checklist_edit
    delete "/:id/delete", PageController, :checklist_delete
    get "/create", PageController, :checklist_create

    get "/:checklist_id/execute", ExecutionAppController, :create
  end

  scope "/execution", MethedrasWeb do
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

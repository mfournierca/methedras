defmodule MethedrasWeb.Router do
  use MethedrasWeb, :router
  alias MethedrasWeb.ChecklistController

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
    get "/checklist", PageController, :checklist_index
    get "/checklist/:id/edit", PageController, :checklist_edit
    get "/checklist/:id/show", PageController, :checklist_show
    get "/checklist/:id/delete", PageController, :checklist_delete
    get "/checklist/create", PageController, :checklist_create
  end

  scope "/api/v1/" do
    pipe_through :api

    resources "/checklist", ChecklistController
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

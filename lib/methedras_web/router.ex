defmodule MethedrasWeb.Router do
  use MethedrasWeb, :router

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

  pipeline :checklist do
    plug :put_layout, {MethedrasWeb.LayoutView, :checklist}
  end

  scope "/", MethedrasWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/checklist", MethedrasWeb do
    pipe_through [:browser, :checklist]

    get "/:checklist_id", PageController, :checklist
  end

  # Other scopes may use custom stacks.
  # scope "/api", MethedrasWeb do
  #   pipe_through :api
  # end
end

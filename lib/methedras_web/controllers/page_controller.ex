defmodule MethedrasWeb.PageController do
  use MethedrasWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def checklist(conn, _params) do
    render conn, "checklist.html"
  end
end

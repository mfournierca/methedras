defmodule MethedrasWeb.PageController do
  use MethedrasWeb, :controller
  alias Methedras.Catalog

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule MethedrasWeb.PageController do
  use MethedrasWeb, :controller
  alias Methedras.Catalog

  def index(conn, _params) do
    render conn, "index.html"
  end

  def checklist_delete(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    {:ok, _checklist} = Catalog.delete_checklist(checklist)

    conn
    |> put_flash(:info, "Checklist deleted successfully.")
    |> redirect(to: page_path(conn, :index))
  end
end

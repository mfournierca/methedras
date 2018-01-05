defmodule MethedrasWeb.PageController do
  use MethedrasWeb, :controller
  alias Methedras.Catalog
  alias Methedras.Catalog.Checklist

  def index(conn, _params) do
    render conn, "index.html"
  end

  def checklist_index(conn, _params) do
    checklists = Catalog.list_checklists()
    render(conn, "checklist_index.html", checklists: checklists)
  end

  def checklist_create(conn) do
    case Catalog.create_checklist(%{"data": %{"title": "default checklist title", "items": []}}) do
      {:ok, checklist} ->
        conn
        |> put_flash(:info, "Checklist created successfully.")
        |> redirect(to: page_path(conn, :checklist_show))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Checklist creation failed.")
        |> redirect(to: page_path(conn, :checklist_index))
    end
  end

  def checklist_show(conn, %{"id" => id}) do
    render(conn, "checklist_show.html")
  end

  def checklist_edit(conn, %{"id" => id}) do
    render(conn, "checklist_edit.html")
  end

  def checklist_delete(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    {:ok, _checklist} = Catalog.delete_checklist(checklist)

    conn
    |> put_flash(:info, "Checklist deleted successfully.")
    |> redirect(to: page_path(conn, :index))
  end
end

defmodule MethedrasWeb.ChecklistAppController do
  use MethedrasWeb, :controller

  alias Methedras.Catalog
  alias Methedras.Catalog.ChecklistApp
  alias MethedrasWeb.ExecutionAppController

  def index(conn, _params) do
    checklists = Catalog.list_checklists()
    render(conn, "index.html", checklists: checklists)
  end

  def create(conn, %{}) do
    case Catalog.create_checklist(%{"data": %{"title": "default checklist title", "items": []}}) do
      {:ok, checklist} ->
        conn
        |> put_flash(:info, "Checklist created successfully.")
        |> redirect(to: page_path(conn, :edit, checklist))
      {:error, %Ecto.Changeset{} = _} ->
        conn
        |> put_flash(:error, "Checklist creation failed.")
        |> redirect(to: page_path(conn, :index))
    end
  end

  def edit(conn, %{"id" => _}) do
    render(conn, "edit.html")
  end

  def delete(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    {:ok, _checklist} = Catalog.delete_checklist(checklist)

    conn
    |> put_flash(:info, "Checklist deleted successfully.")
    |> redirect(to: page_path(conn, :index))
  end

  def create_execution(conn, %{"id" => id}) do
    conn
    |> redirect(to: page_path(ExecutionAppController, :create, %{"checklist_id" => id}))
  end
end

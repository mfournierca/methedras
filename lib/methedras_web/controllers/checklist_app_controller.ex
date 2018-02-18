defmodule MethedrasWeb.ChecklistAppController do
  use MethedrasWeb, :controller

  alias Methedras.Catalog
  alias Methedras.Catalog.ChecklistApp

  def index(conn, _params) do
    checklists = Catalog.list_checklists()
    render(conn, "index.html", checklists: checklists)
  end

  def new(conn, _params) do
    changeset = Catalog.change_checklist_app(%ChecklistApp{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"checklist_app" => checklist_app_params}) do
    case Catalog.create_checklist_app(checklist_app_params) do
      {:ok, checklist_app} ->
        conn
        |> put_flash(:info, "Checklist app created successfully.")
        |> redirect(to: checklist_app_path(conn, :show, checklist_app))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    checklist_app = Catalog.get_checklist_app!(id)
    render(conn, "show.html", checklist_app: checklist_app)
  end

  def edit(conn, %{"id" => id}) do
    checklist_app = Catalog.get_checklist_app!(id)
    changeset = Catalog.change_checklist_app(checklist_app)
    render(conn, "edit.html", checklist_app: checklist_app, changeset: changeset)
  end

  def update(conn, %{"id" => id, "checklist_app" => checklist_app_params}) do
    checklist_app = Catalog.get_checklist_app!(id)

    case Catalog.update_checklist_app(checklist_app, checklist_app_params) do
      {:ok, checklist_app} ->
        conn
        |> put_flash(:info, "Checklist app updated successfully.")
        |> redirect(to: checklist_app_path(conn, :show, checklist_app))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", checklist_app: checklist_app, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    checklist_app = Catalog.get_checklist_app!(id)
    {:ok, _checklist_app} = Catalog.delete_checklist_app(checklist_app)

    conn
    |> put_flash(:info, "Checklist app deleted successfully.")
    |> redirect(to: checklist_app_path(conn, :index))
  end
end

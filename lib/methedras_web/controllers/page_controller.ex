defmodule MethedrasWeb.PageController do
  use MethedrasWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def checklist_index(conn, _params) do
    checklists = Catalog.list_checklists()
    render(conn, "checklist/index.html", checklists: checklists)
  end

  def checklist_new(conn, _params) do
    changeset = Catalog.change_checklist(%Checklist{})
    render(conn, "checklist/new.html", changeset: changeset)
  end

  def checklist_create(conn, %{"checklist" => checklist_params}) do
    case Catalog.create_checklist(checklist_params) do
      {:ok, checklist} ->
        conn
        |> put_flash(:info, "Checklist created successfully.")
        |> redirect(to: web_checklist_path(conn, :show, checklist))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    render(conn, "show.html", checklist: checklist)
  end

  def edit(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    changeset = Catalog.change_checklist(checklist)
    render(conn, "edit.html", checklist: checklist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "checklist" => checklist_params}) do
    checklist = Catalog.get_checklist!(id)

    case Catalog.update_checklist(checklist, checklist_params) do
      {:ok, checklist} ->
        conn
        |> put_flash(:info, "Checklist updated successfully.")
        |> redirect(to: web_checklist_path(conn, :show, checklist))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", checklist: checklist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    {:ok, _checklist} = Catalog.delete_checklist(checklist)

    conn
    |> put_flash(:info, "Checklist deleted successfully.")
    |> redirect(to: web_checklist_path(conn, :index))
  end
end

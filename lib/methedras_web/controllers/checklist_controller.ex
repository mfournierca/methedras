defmodule MethedrasWeb.ChecklistController do
  use MethedrasWeb, :controller

  alias Methedras.Catalog
  alias Methedras.Catalog.Checklist

  action_fallback MethedrasWeb.FallbackController

  def index(conn, _params) do
    checklists = Catalog.list_checklists()
    render(conn, "index.json", checklists: checklists)
  end

  def create(conn, %{"data" => checklist_params}) do
    with {:ok, %Checklist{} = checklist} <- Catalog.create_checklist(checklist_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", checklist_path(conn, :show, checklist))
      |> render("show.json", checklist: checklist)
    end
  end

  def show(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    render(conn, "show.json", checklist: checklist)
  end

  def update(conn, %{"id" => id, "data" => checklist_params}) do
    checklist = Catalog.get_checklist!(id)

    with {:ok, %Checklist{} = checklist} <- Catalog.update_checklist(checklist, checklist_params) do
      render(conn, "show.json", checklist: checklist)
    end
  end

  def delete(conn, %{"id" => id}) do
    checklist = Catalog.get_checklist!(id)
    with {:ok, %Checklist{}} <- Catalog.delete_checklist(checklist) do
      send_resp(conn, :no_content, "")
    end
  end
end

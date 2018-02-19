defmodule MethedrasWeb.ExecutionAppController do
  use MethedrasWeb, :controller

  alias Methedras.Catalog

  def index(conn, _params) do
    executions = Catalog.list_executions()
    render(conn, "index.html", executions: executions)
  end

  def create(conn, %{"checklist_id" => checklist_id}) do
    checklist = Catalog.get_checklist!(checklist_id)
    {:ok, execution} = Catalog.create_execution(%{"checklist_id": checklist.id, "data": checklist.data})

    conn
    |> put_flash(:info, "Created execution")
    |> redirect(to: page_path(conn, :show, execution.id))
  end

  def show(conn, %{"id" => _}) do
    render(conn, "show.html")
  end
end

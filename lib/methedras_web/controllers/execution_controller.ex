defmodule MethedrasWeb.ExecutionController do
  use MethedrasWeb, :controller

  alias Methedras.Catalog
  alias Methedras.Catalog.Execution

  action_fallback MethedrasWeb.FallbackController

  def index(conn, _params) do
    executions = Catalog.list_executions()
    render(conn, "index.json", executions: executions)
  end

  def create(conn, %{"execution" => execution_params}) do
    with {:ok, %Execution{} = execution} <- Catalog.create_execution(execution_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", execution_path(conn, :show, execution))
      |> render("show.json", execution: execution)
    end
  end

  def show(conn, %{"id" => id}) do
    execution = Catalog.get_execution!(id)
    render(conn, "show.json", execution: execution)
  end

  def update(conn, %{"id" => id, "execution" => execution_params}) do
    execution = Catalog.get_execution!(id)

    with {:ok, %Execution{} = execution} <- Catalog.update_execution(execution, execution_params) do
      render(conn, "show.json", execution: execution)
    end
  end

  def delete(conn, %{"id" => id}) do
    execution = Catalog.get_execution!(id)
    with {:ok, %Execution{}} <- Catalog.delete_execution(execution) do
      send_resp(conn, :no_content, "")
    end
  end
end

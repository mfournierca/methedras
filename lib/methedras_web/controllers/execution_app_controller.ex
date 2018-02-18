defmodule MethedrasWeb.ExecutionAppController do
  use MethedrasWeb, :controller

  alias Methedras.Catalog
  alias Methedras.Catalog.ExecutionApp

  def index(conn, _params) do
    executionapp = Catalog.list_executionapp()
    render(conn, "index.html", executionapp: executionapp)
  end

  def new(conn, _params) do
    changeset = Catalog.change_execution_app(%ExecutionApp{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"execution_app" => execution_app_params}) do
    case Catalog.create_execution_app(execution_app_params) do
      {:ok, execution_app} ->
        conn
        |> put_flash(:info, "Execution app created successfully.")
        |> redirect(to: execution_app_path(conn, :show, execution_app))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    execution_app = Catalog.get_execution_app!(id)
    render(conn, "show.html", execution_app: execution_app)
  end

  def edit(conn, %{"id" => id}) do
    execution_app = Catalog.get_execution_app!(id)
    changeset = Catalog.change_execution_app(execution_app)
    render(conn, "edit.html", execution_app: execution_app, changeset: changeset)
  end

  def update(conn, %{"id" => id, "execution_app" => execution_app_params}) do
    execution_app = Catalog.get_execution_app!(id)

    case Catalog.update_execution_app(execution_app, execution_app_params) do
      {:ok, execution_app} ->
        conn
        |> put_flash(:info, "Execution app updated successfully.")
        |> redirect(to: execution_app_path(conn, :show, execution_app))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", execution_app: execution_app, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    execution_app = Catalog.get_execution_app!(id)
    {:ok, _execution_app} = Catalog.delete_execution_app(execution_app)

    conn
    |> put_flash(:info, "Execution app deleted successfully.")
    |> redirect(to: execution_app_path(conn, :index))
  end
end

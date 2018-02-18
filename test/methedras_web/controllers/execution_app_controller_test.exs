defmodule MethedrasWeb.ExecutionAppControllerTest do
  use MethedrasWeb.ConnCase

  alias Methedras.Catalog

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:execution_app) do
    {:ok, execution_app} = Catalog.create_execution_app(@create_attrs)
    execution_app
  end

  describe "index" do
    test "lists all executionapp", %{conn: conn} do
      conn = get conn, execution_app_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Executionapp"
    end
  end

  describe "new execution_app" do
    test "renders form", %{conn: conn} do
      conn = get conn, execution_app_path(conn, :new)
      assert html_response(conn, 200) =~ "New Execution app"
    end
  end

  describe "create execution_app" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, execution_app_path(conn, :create), execution_app: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == execution_app_path(conn, :show, id)

      conn = get conn, execution_app_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Execution app"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, execution_app_path(conn, :create), execution_app: @invalid_attrs
      assert html_response(conn, 200) =~ "New Execution app"
    end
  end

  describe "edit execution_app" do
    setup [:create_execution_app]

    test "renders form for editing chosen execution_app", %{conn: conn, execution_app: execution_app} do
      conn = get conn, execution_app_path(conn, :edit, execution_app)
      assert html_response(conn, 200) =~ "Edit Execution app"
    end
  end

  describe "update execution_app" do
    setup [:create_execution_app]

    test "redirects when data is valid", %{conn: conn, execution_app: execution_app} do
      conn = put conn, execution_app_path(conn, :update, execution_app), execution_app: @update_attrs
      assert redirected_to(conn) == execution_app_path(conn, :show, execution_app)

      conn = get conn, execution_app_path(conn, :show, execution_app)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, execution_app: execution_app} do
      conn = put conn, execution_app_path(conn, :update, execution_app), execution_app: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Execution app"
    end
  end

  describe "delete execution_app" do
    setup [:create_execution_app]

    test "deletes chosen execution_app", %{conn: conn, execution_app: execution_app} do
      conn = delete conn, execution_app_path(conn, :delete, execution_app)
      assert redirected_to(conn) == execution_app_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, execution_app_path(conn, :show, execution_app)
      end
    end
  end

  defp create_execution_app(_) do
    execution_app = fixture(:execution_app)
    {:ok, execution_app: execution_app}
  end
end

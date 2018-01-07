defmodule MethedrasWeb.ExecutionControllerTest do
  use MethedrasWeb.ConnCase

  alias Methedras.Catalog
  alias Methedras.Catalog.Execution

  @create_attrs %{data: %{}}
  @update_attrs %{data: %{}}
  @invalid_attrs %{data: nil}

  def fixture(:execution) do
    {:ok, execution} = Catalog.create_execution(@create_attrs)
    execution
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all executions", %{conn: conn} do
      conn = get conn, execution_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create execution" do
    test "renders execution when data is valid", %{conn: conn} do
      conn = post conn, execution_path(conn, :create), execution: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, execution_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "data" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, execution_path(conn, :create), execution: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update execution" do
    setup [:create_execution]

    test "renders execution when data is valid", %{conn: conn, execution: %Execution{id: id} = execution} do
      conn = put conn, execution_path(conn, :update, execution), execution: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, execution_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "data" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn, execution: execution} do
      conn = put conn, execution_path(conn, :update, execution), execution: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete execution" do
    setup [:create_execution]

    test "deletes chosen execution", %{conn: conn, execution: execution} do
      conn = delete conn, execution_path(conn, :delete, execution)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, execution_path(conn, :show, execution)
      end
    end
  end

  defp create_execution(_) do
    execution = fixture(:execution)
    {:ok, execution: execution}
  end
end

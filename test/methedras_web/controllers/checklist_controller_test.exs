defmodule MethedrasWeb.ChecklistControllerTest do
  use MethedrasWeb.ConnCase

  alias Methedras.Catalog
  alias Methedras.Catalog.Checklist

  @create_attrs %{data: %{}}
  @update_attrs %{data: %{}}
  @invalid_attrs %{data: nil}

  def fixture(:checklist) do
    {:ok, checklist} = Catalog.create_checklist(@create_attrs)
    checklist
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all checklists", %{conn: conn} do
      conn = get conn, checklist_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create checklist" do
    test "renders checklist when data is valid", %{conn: conn} do
      conn = post conn, checklist_path(conn, :create), checklist: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, checklist_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "data" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, checklist_path(conn, :create), checklist: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update checklist" do
    setup [:create_checklist]

    test "renders checklist when data is valid", %{conn: conn, checklist: %Checklist{id: id} = checklist} do
      conn = put conn, checklist_path(conn, :update, checklist), checklist: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, checklist_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "data" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn, checklist: checklist} do
      conn = put conn, checklist_path(conn, :update, checklist), checklist: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete checklist" do
    setup [:create_checklist]

    test "deletes chosen checklist", %{conn: conn, checklist: checklist} do
      conn = delete conn, checklist_path(conn, :delete, checklist)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, checklist_path(conn, :show, checklist)
      end
    end
  end

  defp create_checklist(_) do
    checklist = fixture(:checklist)
    {:ok, checklist: checklist}
  end
end

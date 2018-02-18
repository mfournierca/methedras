defmodule MethedrasWeb.ChecklistAppControllerTest do
  use MethedrasWeb.ConnCase

  alias Methedras.Catalog

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:checklist_app) do
    {:ok, checklist_app} = Catalog.create_checklist_app(@create_attrs)
    checklist_app
  end

  describe "index" do
    test "lists all checklistapp", %{conn: conn} do
      conn = get conn, checklist_app_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Checklistapp"
    end
  end

  describe "new checklist_app" do
    test "renders form", %{conn: conn} do
      conn = get conn, checklist_app_path(conn, :new)
      assert html_response(conn, 200) =~ "New Checklist app"
    end
  end

  describe "create checklist_app" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, checklist_app_path(conn, :create), checklist_app: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == checklist_app_path(conn, :show, id)

      conn = get conn, checklist_app_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Checklist app"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, checklist_app_path(conn, :create), checklist_app: @invalid_attrs
      assert html_response(conn, 200) =~ "New Checklist app"
    end
  end

  describe "edit checklist_app" do
    setup [:create_checklist_app]

    test "renders form for editing chosen checklist_app", %{conn: conn, checklist_app: checklist_app} do
      conn = get conn, checklist_app_path(conn, :edit, checklist_app)
      assert html_response(conn, 200) =~ "Edit Checklist app"
    end
  end

  describe "update checklist_app" do
    setup [:create_checklist_app]

    test "redirects when data is valid", %{conn: conn, checklist_app: checklist_app} do
      conn = put conn, checklist_app_path(conn, :update, checklist_app), checklist_app: @update_attrs
      assert redirected_to(conn) == checklist_app_path(conn, :show, checklist_app)

      conn = get conn, checklist_app_path(conn, :show, checklist_app)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, checklist_app: checklist_app} do
      conn = put conn, checklist_app_path(conn, :update, checklist_app), checklist_app: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Checklist app"
    end
  end

  describe "delete checklist_app" do
    setup [:create_checklist_app]

    test "deletes chosen checklist_app", %{conn: conn, checklist_app: checklist_app} do
      conn = delete conn, checklist_app_path(conn, :delete, checklist_app)
      assert redirected_to(conn) == checklist_app_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, checklist_app_path(conn, :show, checklist_app)
      end
    end
  end

  defp create_checklist_app(_) do
    checklist_app = fixture(:checklist_app)
    {:ok, checklist_app: checklist_app}
  end
end

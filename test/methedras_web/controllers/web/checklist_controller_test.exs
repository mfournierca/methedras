defmodule MethedrasWeb.:"Elixir.web.Checklist"ControllerTest do
  use MethedrasWeb.ConnCase

  alias Methedras.Catalog

  @create_attrs %{data: %{}}
  @update_attrs %{data: %{}}
  @invalid_attrs %{data: nil}

  def fixture(:checklist) do
    {:ok, checklist} = Catalog.create_checklist(@create_attrs)
    checklist
  end

  describe "index" do
    test "lists all checklists", %{conn: conn} do
      conn = get conn, web_checklist_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Checklists"
    end
  end

  describe "new checklist" do
    test "renders form", %{conn: conn} do
      conn = get conn, web_checklist_path(conn, :new)
      assert html_response(conn, 200) =~ "New Checklist"
    end
  end

  describe "create checklist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, web_checklist_path(conn, :create), checklist: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == web_checklist_path(conn, :show, id)

      conn = get conn, web_checklist_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Checklist"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, web_checklist_path(conn, :create), checklist: @invalid_attrs
      assert html_response(conn, 200) =~ "New Checklist"
    end
  end

  describe "edit checklist" do
    setup [:create_checklist]

    test "renders form for editing chosen checklist", %{conn: conn, checklist: checklist} do
      conn = get conn, web_checklist_path(conn, :edit, checklist)
      assert html_response(conn, 200) =~ "Edit Checklist"
    end
  end

  describe "update checklist" do
    setup [:create_checklist]

    test "redirects when data is valid", %{conn: conn, checklist: checklist} do
      conn = put conn, web_checklist_path(conn, :update, checklist), checklist: @update_attrs
      assert redirected_to(conn) == web_checklist_path(conn, :show, checklist)

      conn = get conn, web_checklist_path(conn, :show, checklist)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, checklist: checklist} do
      conn = put conn, web_checklist_path(conn, :update, checklist), checklist: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Checklist"
    end
  end

  describe "delete checklist" do
    setup [:create_checklist]

    test "deletes chosen checklist", %{conn: conn, checklist: checklist} do
      conn = delete conn, web_checklist_path(conn, :delete, checklist)
      assert redirected_to(conn) == web_checklist_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, web_checklist_path(conn, :show, checklist)
      end
    end
  end

  defp create_checklist(_) do
    checklist = fixture(:checklist)
    {:ok, checklist: checklist}
  end
end

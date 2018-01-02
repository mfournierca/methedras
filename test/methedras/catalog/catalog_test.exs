defmodule Methedras.CatalogTest do
  use Methedras.DataCase

  alias Methedras.Catalog

  describe "users" do
    alias Methedras.Catalog.User

    @valid_attrs %{email: "some email", realm: "some realm", username: "some username"}
    @update_attrs %{email: "some updated email", realm: "some updated realm", username: "some updated username"}
    @invalid_attrs %{email: nil, realm: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Catalog.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Catalog.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Catalog.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.realm == "some realm"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Catalog.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.realm == "some updated realm"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_user(user, @invalid_attrs)
      assert user == Catalog.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Catalog.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Catalog.change_user(user)
    end
  end

  describe "checklists" do
    alias Methedras.Catalog.Checklist

    @valid_attrs %{data: %{}}
    @update_attrs %{data: %{}}
    @invalid_attrs %{data: nil}

    def checklist_fixture(attrs \\ %{}) do
      {:ok, checklist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_checklist()

      checklist
    end

    test "list_checklists/0 returns all checklists" do
      checklist = checklist_fixture()
      assert Catalog.list_checklists() == [checklist]
    end

    test "get_checklist!/1 returns the checklist with given id" do
      checklist = checklist_fixture()
      assert Catalog.get_checklist!(checklist.id) == checklist
    end

    test "create_checklist/1 with valid data creates a checklist" do
      assert {:ok, %Checklist{} = checklist} = Catalog.create_checklist(@valid_attrs)
      assert checklist.data == %{}
    end

    test "create_checklist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_checklist(@invalid_attrs)
    end

    test "update_checklist/2 with valid data updates the checklist" do
      checklist = checklist_fixture()
      assert {:ok, checklist} = Catalog.update_checklist(checklist, @update_attrs)
      assert %Checklist{} = checklist
      assert checklist.data == %{}
    end

    test "update_checklist/2 with invalid data returns error changeset" do
      checklist = checklist_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_checklist(checklist, @invalid_attrs)
      assert checklist == Catalog.get_checklist!(checklist.id)
    end

    test "delete_checklist/1 deletes the checklist" do
      checklist = checklist_fixture()
      assert {:ok, %Checklist{}} = Catalog.delete_checklist(checklist)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_checklist!(checklist.id) end
    end

    test "change_checklist/1 returns a checklist changeset" do
      checklist = checklist_fixture()
      assert %Ecto.Changeset{} = Catalog.change_checklist(checklist)
    end
  end
end

defmodule Methedras.CatalogTest do
  use Methedras.DataCase

  alias Methedras.Catalog

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

  describe "executions" do
    alias Methedras.Catalog.Execution

    @valid_attrs %{data: %{}}
    @update_attrs %{data: %{}}
    @invalid_attrs %{data: nil}

    def execution_fixture(attrs \\ %{}) do
      {:ok, execution} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_execution()

      execution
    end

    test "list_executions/0 returns all executions" do
      execution = execution_fixture()
      assert Catalog.list_executions() == [execution]
    end

    test "get_execution!/1 returns the execution with given id" do
      execution = execution_fixture()
      assert Catalog.get_execution!(execution.id) == execution
    end

    test "create_execution/1 with valid data creates a execution" do
      assert {:ok, %Execution{} = execution} = Catalog.create_execution(@valid_attrs)
      assert execution.data == %{}
    end

    test "create_execution/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_execution(@invalid_attrs)
    end

    test "update_execution/2 with valid data updates the execution" do
      execution = execution_fixture()
      assert {:ok, execution} = Catalog.update_execution(execution, @update_attrs)
      assert %Execution{} = execution
      assert execution.data == %{}
    end

    test "update_execution/2 with invalid data returns error changeset" do
      execution = execution_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_execution(execution, @invalid_attrs)
      assert execution == Catalog.get_execution!(execution.id)
    end

    test "delete_execution/1 deletes the execution" do
      execution = execution_fixture()
      assert {:ok, %Execution{}} = Catalog.delete_execution(execution)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_execution!(execution.id) end
    end

    test "change_execution/1 returns a execution changeset" do
      execution = execution_fixture()
      assert %Ecto.Changeset{} = Catalog.change_execution(execution)
    end
  end
end

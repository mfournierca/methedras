defmodule Methedras.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Methedras.Repo

  alias Methedras.Catalog.Checklist

  @doc """
  Returns the list of checklists.

  ## Examples

      iex> list_checklists()
      [%Checklist{}, ...]

  """
  def list_checklists do
    Repo.all(Checklist)
  end

  @doc """
  Gets a single checklist.

  Raises `Ecto.NoResultsError` if the Checklist does not exist.

  ## Examples

      iex> get_checklist!(123)
      %Checklist{}

      iex> get_checklist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_checklist!(id), do: Repo.get!(Checklist, id)

  @doc """
  Creates a checklist.

  ## Examples

      iex> create_checklist(%{field: value})
      {:ok, %Checklist{}}

      iex> create_checklist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_checklist(attrs \\ %{}) do
    %Checklist{}
    |> Checklist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a checklist.

  ## Examples

      iex> update_checklist(checklist, %{field: new_value})
      {:ok, %Checklist{}}

      iex> update_checklist(checklist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_checklist(%Checklist{} = checklist, attrs) do
    checklist
    |> Checklist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Checklist.

  ## Examples

      iex> delete_checklist(checklist)
      {:ok, %Checklist{}}

      iex> delete_checklist(checklist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_checklist(%Checklist{} = checklist) do
    Repo.delete(checklist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking checklist changes.

  ## Examples

      iex> change_checklist(checklist)
      %Ecto.Changeset{source: %Checklist{}}

  """
  def change_checklist(%Checklist{} = checklist) do
    Checklist.changeset(checklist, %{})
  end

  alias Methedras.Catalog.Execution

  @doc """
  Returns the list of executions.

  ## Examples

      iex> list_executions()
      [%Execution{}, ...]

  """
  def list_executions do
    Repo.all(Execution)
  end

  @doc """
  Gets a single execution.

  Raises `Ecto.NoResultsError` if the Execution does not exist.

  ## Examples

      iex> get_execution!(123)
      %Execution{}

      iex> get_execution!(456)
      ** (Ecto.NoResultsError)

  """
  def get_execution!(id), do: Repo.get!(Execution, id)

  @doc """
  Creates a execution.

  ## Examples

      iex> create_execution(%{field: value})
      {:ok, %Execution{}}

      iex> create_execution(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_execution(attrs \\ %{}) do
    %Execution{}
    |> Execution.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a execution.

  ## Examples

      iex> update_execution(execution, %{field: new_value})
      {:ok, %Execution{}}

      iex> update_execution(execution, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_execution(%Execution{} = execution, attrs) do
    execution
    |> Execution.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Execution.

  ## Examples

      iex> delete_execution(execution)
      {:ok, %Execution{}}

      iex> delete_execution(execution)
      {:error, %Ecto.Changeset{}}

  """
  def delete_execution(%Execution{} = execution) do
    Repo.delete(execution)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking execution changes.

  ## Examples

      iex> change_execution(execution)
      %Ecto.Changeset{source: %Execution{}}

  """
  def change_execution(%Execution{} = execution) do
    Execution.changeset(execution, %{})
  end
end

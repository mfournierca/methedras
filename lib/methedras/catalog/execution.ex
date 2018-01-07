defmodule Methedras.Catalog.Execution do
  use Ecto.Schema
  import Ecto.Changeset
  alias Methedras.Catalog.Execution


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "executions" do
    field :data, :map
    field :checklist_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Execution{} = execution, attrs) do
    execution
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end

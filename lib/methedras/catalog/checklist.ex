defmodule Methedras.Catalog.Checklist do
  use Ecto.Schema
  import Ecto.Changeset
  alias Methedras.Catalog.Checklist
  alias Methedras.Catalog.Execution

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "checklists" do
    field :data, :map
    has_many :executions, Execution
    timestamps()
  end

  @doc false
  def changeset(%Checklist{} = checklist, attrs) do
    checklist
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end

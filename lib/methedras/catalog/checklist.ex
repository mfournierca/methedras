defmodule Methedras.Catalog.Checklist do
  use Ecto.Schema
  import Ecto.Changeset
  alias Methedras.Catalog.Checklist


  schema "checklists" do
    field :data, :map
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(%Checklist{} = checklist, attrs) do
    checklist
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end

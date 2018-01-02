defmodule Methedras.Catalog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Methedras.Catalog.User
  alias Methedras.Catalog.Checklist

  schema "users" do
    field :email, :string
    field :realm, :string
    field :username, :string

    has_many :checklists, Checklist, foreign_key: :created_by

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :realm])
    |> validate_required([:username, :email, :realm])
  end
end

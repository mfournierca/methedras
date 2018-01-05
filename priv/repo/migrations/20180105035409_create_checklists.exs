defmodule Methedras.Repo.Migrations.CreateChecklists do
  use Ecto.Migration

  def change do
    create table(:checklists, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :data, :map

      timestamps()
    end

  end
end

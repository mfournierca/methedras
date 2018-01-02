defmodule Methedras.Repo.Migrations.CreateChecklists do
  use Ecto.Migration

  def change do
    create table(:checklists) do
      add :data, :map
      add :created_by, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:checklists, [:created_by])
  end
end

defmodule Methedras.Repo.Migrations.CreateExecutions do
  use Ecto.Migration

  def change do
    create table(:executions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :data, :map
      add :checklist_id, references(:checklists, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:executions, [:checklist_id])
  end
end

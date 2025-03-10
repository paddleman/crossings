defmodule Crossings.Repo.Migrations.CreateStructures do
  use Ecto.Migration

  def change do
    create table(:structures) do
      add :data_source, :string
      add :structure_type_id, references(:structure_type, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:structures, [:structure_type_id])
  end
end

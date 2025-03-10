defmodule Crossings.Repo.Migrations.CreateCrossings do
  use Ecto.Migration

  def change do
    create table(:crossings) do
      add :watercourse_id, references(:watercourse, on_delete: :nothing)
      add :road_id, references(:road, on_delete: :nothing)
      add :watershed_id, references(:watershed, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:crossings, [:watercourse_id])
    create index(:crossings, [:road_id])
    create index(:crossings, [:watershed_id])
  end
end

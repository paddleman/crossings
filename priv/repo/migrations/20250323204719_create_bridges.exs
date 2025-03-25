defmodule Crossings.Repo.Migrations.CreateBridges do
  use Ecto.Migration

  def change do
    create table(:bridges) do
      add :data_source, :string
      add :structure_number, :string
      add :structure_name, :string

      add :shape, :string
      add :type, :string
      add :year_built, :integer
      # Size
      add :length, :float
      add :diameter, :integer
      add :width, :integer
      add :height, :integer
      add :cover_depth, :integer
      # Inspection Info
      add :bci, :float
      add :urgency, :integer
      add :last_inspected, :date
      # Location
      add :service_area_code, :integer
      add :latitude, :float
      add :longitude, :float

      timestamps(type: :utc_datetime)
    end
  end
end

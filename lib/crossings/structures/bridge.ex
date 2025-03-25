defmodule Crossings.Structure.Bridge do
  use Ecto.Schema
  import Ecto.Changeset
  alias Geo.PostGIS.Geometry

  schema "bridges" do
    field :structure_type, Enum, values: [:bridge, :culvert, :other]
    field :data_source, Enum, values: [:BMIS, :PSCIS, :CHRIS, :HWY_37, :HWY_51, :OTHER]
    field :structure_number, :string
    field :structure_name, :string
    field :type, :string
    field :length, :float
    field :maintenance_deck_area, :float
    field :number_of_spans, :integer
    field :span_material, :string

    field :bci, :float
    field :urgency, :integer
    field :year_built, :integer
    field :last_inspected, :date
    field :service_area_code, :integer
    field :geom, Geometry.Point
    field :lat, :float, source: :latitude
    field :lng, :float, source: :longitude
    field :data_source, :string

    belongs_to :structure, Crossings.Structure

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bridge, attrs) do
    bridge
    |> cast(attrs, [
      :structure_number,
      :structure_name,
      :shape,
      :type,
      :length,
      :diameter,
      :width,
      :height,
      :cover_depth,
      :bci,
      :urgency,
      :year_build,
      :last_inspected,
      :service_area_code,
      :latitude,
      :longitude,
      :data_source
    ])
    |> validate_required([
      :structure_number,
      :structure_name,
      :shape,
      :type,
      :length,
      :diameter,
      :width,
      :height,
      :cover_depth,
      :bci,
      :urgency,
      :year_build,
      :last_inspected,
      :service_area_code,
      :latitude,
      :longitude,
      :data_source
    ])
  end
end

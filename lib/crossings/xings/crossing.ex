defmodule Crossings.Xings.Crossing do
  use Ecto.Schema
  import Ecto.Changeset
  import Geo

  schema "crossings" do
    field :geom, Geo.PostGIS.Geometry
    field :latitude, :float
    field :longitude, :float

    belongs_to :watercourse, Crossings.Xings.Watercourse
    belongs_to :road, Crossings.Xings.Road
    belongs_to :watershed, Crossings.Xings.Watershed
    has_many :structures, Crossings.Structures.Structure

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(crossing, attrs) do
    crossing
    |> cast(attrs, [])
    |> validate_required([])
  end
end

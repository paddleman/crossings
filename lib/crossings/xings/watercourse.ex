defmodule Crossings.Xings.Watercourse do
  use Ecto.Schema
  import Ecto.Changeset
  import Geo

  schema "crossings" do
    field :geom, Geo.PostGIS.Geometry

    has_many :crossings, Crossings.Xings.Crossing

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(crossing, attrs) do
    crossing
    |> cast(attrs, [])
    |> validate_required([])
  end
end

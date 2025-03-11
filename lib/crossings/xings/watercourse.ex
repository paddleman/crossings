defmodule Crossings.Xings.Watercourse do
  use Ecto.Schema
  import Ecto.Changeset
  import Geo

  schema "watercourses" do
    field :blue_line_key, :integer
    field :fwa_watershed_code, :string
    field :watershed_group_code, :string
    field :feature_source, :string
    field :gnis_name, :string
    field :stream_order, :integer
    field :stream_magnitude, :integer

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

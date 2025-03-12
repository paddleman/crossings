defmodule Crossings.Xings.Crossing do
  use Ecto.Schema
  import Ecto.Changeset
  import Geo

  @derive {Jason.Encoder,
           only: [
             :id,
             :lat,
             :lng
           ]}
  schema "crossings" do
    # field :geom, Geo.PostGIS.Geometry
    field :service_area_number, :integer
    field :service_area_name, :string
    field :mott_district_number, :integer
    field :mott_district_name, :string
    field :lat, :float
    field :lng, :float

    belongs_to :watercourse, Crossings.Xings.Watercourse
    belongs_to :road, Crossings.Xings.Road
    # belongs_to :watershed, Crossings.Xings.Watershed
    # has_many :structures, Crossings.Structures.Structure

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(crossing, attrs) do
    crossing
    |> cast(attrs, [])
    |> validate_required([])
  end
end

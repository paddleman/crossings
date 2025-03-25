defmodule Crossings.Xings.Crossing do
  use Ecto.Schema
  import Ecto.Changeset
  import Geo

  alias Crossings.Structures.Structure
  alias Crossings.Xings.Watercourse
  alias Crossings.Xings.Road
  alias Crossings.Xings.Watershed

  @derive {Jason.Encoder,
           only: [
             :id,
             :service_area_number,
             :service_area_name,
             :mott_district_number,
             :mott_district_name,
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

    belongs_to :watercourse, Watercourse
    belongs_to :road, Road
    # belongs_to :watershed, Watershed
    has_many :structures, Structure

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(crossing, attrs) do
    crossing
    |> cast(attrs, [])
    |> validate_required([])
  end
end

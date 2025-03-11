defmodule Crossings.Xings.Road do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roads" do
    field :transport_line_type_code, :string
    field :transport_line_surface_code, :string
    field :transport_line_divided_code, :string
    field :travel_direction_code, :string
    field :transport_line_structure_code, :string
    field :speed_limit, :integer
    field :left_number_of_lanes, :integer
    field :right_number_of_lanes, :integer
    field :total_number_of_lanes, :integer
    field :under_construction_ind, :string
    field :virtual_ind, :string
    field :disaster_route_ind, :string
    field :truck_route_ind, :string
    field :left_locality, :string
    field :right_locality, :string
    field :left_regional_district_id, :string
    field :right_regional_district_id, :string
    field :structured_name_1, :string
    field :structured_name_2, :string
    field :structured_name_3, :string
    field :highway_route_1, :string
    field :industry_name_1, :string
    field :lane_restriction_code, :string
    field :access_restriction_code, :string
    field :ministry_of_transport_id, :integer
    field :ministry_of_transport_name, :string
    field :integration_notes, :string
    field :excluded_rules, :string
    field :demographic_ind, :string

    field :geom, Geo.PostGIS.Geometry

    has_many :crossings, Crossings.Xings.Crossing

    # timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(road, attrs) do
    road
    |> cast(attrs, [:transport_line_type_code])
    |> validate_required([])
  end
end

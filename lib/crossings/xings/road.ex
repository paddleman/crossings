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

  def road_fields() do
    [
      ["Line Type Code", "transport_line_type_code"],
      ["Road Surface", "transport_line_surface_code"],
      ["Travel Direction", "travel_direction_code"],
      ["Line Structure", "transport_line_structure_code"],
      ["Speed Limit", "speed_limit"],
      ["No. Left Lanes", "left_number_of_lanes"],
      ["No. Right Lanes", "right_number_of_lanes"],
      ["No. Lanes", "total_number_of_lanes"],
      ["Under Construction", "under_construction_ind"],
      ["Virtual Index", "virtual_ind"],
      ["Disaster Route", "disaster_route_ind"],
      ["Truck Route", "truck_route_ind"],
      ["Demographic Indicator", "demographic_ind"],
      ["Left Locality", "left_locality"],
      ["Right Locality", "right_locality"],
      ["Left Regional District", "left_regional_district_id"],
      ["Right Regional District", "right_regional_district_id"],
      ["Name 1", "structured_name_1"],
      ["Name 2", "structured_name_2"],
      ["Name 3", "structured_name_3"],
      ["Hwy #", "highway_route_1"],
      ["Industry Name", "industry_name_1"],
      ["Lane Restriction", "lane_restriction_code"],
      ["Access Restriction", "access_restriction_code"],
      ["MOTT", "ministry_of_transport_id"],
      ["MOTT Name", "ministry_of_transport_name"],
      ["Integration Notes", "integration_notes"],
      ["Excluded Rules", "excluded_rules"]
    ]
  end
end

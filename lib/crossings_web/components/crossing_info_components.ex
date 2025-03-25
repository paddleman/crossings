defmodule CrossingsWeb.CrossingInfoComponents do
  @moduledoc """
   This module is responsible for rendering the crossing information.
  """

  use Phoenix.Component
  use Gettext, backend: CrossingsWeb.Gettext

  alias Phoenix.LiveView.JSs

  @doc """
  Basic Crossing Information summary.
  """

  attr :road, :map

  def road_info(assigns) do
    ~H"""

      <div class="w-1/4 border-2 border-zinc-100 rounded p-2">

        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">MOTT Name:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.ministry_of_transport_name}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Highway #:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.highway_route_1}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Industry Name:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.industry_name_1}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Structured Name 1:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.structured_name_1}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Structured Name 2:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.structured_name_2}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Structured Name 3:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.structured_name_3}</span>
        </div>



        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Line Type Code:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.transport_line_type_code}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Road Surface:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.transport_line_surface_code}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Travel Direction:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.travel_direction_code}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Line Structure:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.transport_line_structure_code}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Speed Limit:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.speed_limit}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">No. Lanes:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.total_number_of_lanes}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Under Construction:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.under_construction_ind}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Virtual Index:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.virtual_ind}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Disaster Route:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.disaster_route_ind}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Truck Route:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.truck_route_ind}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Demographic:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.demographic_ind}</span>
        </div>

        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Locality:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.right_locality}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Regional District:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.left_regional_district_id}</span>
        </div>

        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Integration Notes:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.integration_notes}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Excluded Rules:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.excluded_rules}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Lane Restriction:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.lane_restriction_code}</span>
        </div>
        <div class="flex justify-between">
          <span class="font-semibold text-sm text-zinc-100">Access Restriction:</span>
          <span class="text-zinc-100 text-base font-bold">{@road.access_restriction_code}</span>
        </div>

    </div>
    """
  end
end

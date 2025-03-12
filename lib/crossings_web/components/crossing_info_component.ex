defmodule CrossingsWeb.CrossingInfoComponent do
  use Phoenix.LiveComponent
  # alias Crossings.Utilities
  # import CrossingsWeb.CoreComponents

  def mount(_params, _session, socket) do
    # socket = assign(socket, key: value)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="border-2 border-zinc-100 rounded mb-2">
        <div class="py-1 text-2xl font-bold text-white text-center">
          {@cross.road.ministry_of_transport_name} - {@cross.watercourse.gnis_name}
        </div>
      </div>
      <%!-- <div class="border-2 border-zinc-100 rounded mb-2">
        <div class="flex">
          <div class="w-2/5 py-1 text-2xl font-bold text-white text-center">
            <span class="font-thin text-zinc-300">Service Area:</span>
            <span :if={@cross.drainage_area_gross != nil} class="font-semibold text-zinc-100">
              {Utilities.pretty_num(@stn.drainage_area_gross, 1)}
            </span>
          </div>

          <div class="w-1/5 py-1 text-2xl font-bold text-white text-center">
            <span class="font-thin text-zinc-300">Status:</span>
            <span class="font-semibold text-zinc-100">
              {@stn.hyd_status} | {@stn.regulated}
            </span>
          </div>

          <div class="w-1/5 py-1 text-2xl font-bold text-white text-center">
            <span class="font-thin text-zinc-300">Time Span:</span>
            <span class="font-semibold text-zinc-100">
              {@stn.from_year} - {@stn.to_year}
            </span>
          </div>
          <div class="w-1/5 py-1 text-2xl font-bold text-white text-center">
            <span class="font-thin text-zinc-300">Record Length(yrs):</span>
            <span class="font-semibold text-zinc-100">
              {@stn.record_length}
            </span>
          </div>
        </div> --%>
    </div>
    """
  end
end

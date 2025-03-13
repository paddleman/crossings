defmodule CrossingsWeb.CrossingLive.Index do
  use CrossingsWeb, :live_view

  alias Crossings.Xings
  alias Crossings.Xings.Crossing

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Crossings")
    |> assign(:crossings, list_crossings())
    |> assign(:selected_crossing, nil)
  end

  @impl true
  def handle_event("get-crossings", _, socket) do
    {:reply, %{crossings: socket.assigns.crossings}, socket}
  end

  def handle_event("marker-clicked", %{"crossingId" => id}, socket) do
    crossing = get_crossing(id)
    IO.inspect(crossing)

    socket =
      socket
      |> assign(:selected_crossing, crossing)

    {:noreply, %{crossing: crossing}, socket}
  end

  defp list_crossings() do
    Xings.list_crossings()
  end

  defp get_crossing(id) do
    Xings.get_crossing!(id)
  end

  defp find_crossing(socket, id) do
    Enum.find(socket.assigns.crossings, &(&1.id == id))
  end
end

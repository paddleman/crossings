defmodule CrossingsWeb.BridgeLive.Index do
  use CrossingsWeb, :live_view

  alias Crossings.Structure
  alias Crossings.Structure.Bridge

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :bridges, Structure.list_bridges())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Bridge")
    |> assign(:bridge, Structure.get_bridge!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Bridge")
    |> assign(:bridge, %Bridge{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Bridges")
    |> assign(:bridge, nil)
  end

  @impl true
  def handle_info({CrossingsWeb.BridgeLive.FormComponent, {:saved, bridge}}, socket) do
    {:noreply, stream_insert(socket, :bridges, bridge)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    bridge = Structure.get_bridge!(id)
    {:ok, _} = Structure.delete_bridge(bridge)

    {:noreply, stream_delete(socket, :bridges, bridge)}
  end
end

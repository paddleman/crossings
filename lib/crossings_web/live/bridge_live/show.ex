defmodule CrossingsWeb.BridgeLive.Show do
  use CrossingsWeb, :live_view

  alias Crossings.Structure

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:bridge, Structure.get_bridge!(id))}
  end

  defp page_title(:show), do: "Show Bridge"
  defp page_title(:edit), do: "Edit Bridge"
end

defmodule CrossingsWeb.CrossingLive.Show do
  use CrossingsWeb, :live_view

  alias Crossings.Xings

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:crossing, Xings.get_crossing!(id))}
  end

  defp page_title(:show), do: "Show Crossing"
  defp page_title(:edit), do: "Edit Crossing"
end

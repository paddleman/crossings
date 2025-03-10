defmodule CrossingsWeb.CrossingLive.Index do
  use CrossingsWeb, :live_view

  alias Crossings.Xings
  alias Crossings.Xings.Crossing

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :crossings, Xings.list_crossings())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Crossing")
    |> assign(:crossing, Xings.get_crossing!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Crossing")
    |> assign(:crossing, %Crossing{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Crossings")
    |> assign(:crossing, nil)
  end

  @impl true
  def handle_info({CrossingsWeb.CrossingLive.FormComponent, {:saved, crossing}}, socket) do
    {:noreply, stream_insert(socket, :crossings, crossing)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    crossing = Xings.get_crossing!(id)
    {:ok, _} = Xings.delete_crossing(crossing)

    {:noreply, stream_delete(socket, :crossings, crossing)}
  end
end

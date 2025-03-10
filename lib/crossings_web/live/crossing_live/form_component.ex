defmodule CrossingsWeb.CrossingLive.FormComponent do
  use CrossingsWeb, :live_component

  alias Crossings.Xings

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage crossing records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="crossing-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

        <:actions>
          <.button phx-disable-with="Saving...">Save Crossing</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{crossing: crossing} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Xings.change_crossing(crossing))
     end)}
  end

  @impl true
  def handle_event("validate", %{"crossing" => crossing_params}, socket) do
    changeset = Xings.change_crossing(socket.assigns.crossing, crossing_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"crossing" => crossing_params}, socket) do
    save_crossing(socket, socket.assigns.action, crossing_params)
  end

  defp save_crossing(socket, :edit, crossing_params) do
    case Xings.update_crossing(socket.assigns.crossing, crossing_params) do
      {:ok, crossing} ->
        notify_parent({:saved, crossing})

        {:noreply,
         socket
         |> put_flash(:info, "Crossing updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_crossing(socket, :new, crossing_params) do
    case Xings.create_crossing(crossing_params) do
      {:ok, crossing} ->
        notify_parent({:saved, crossing})

        {:noreply,
         socket
         |> put_flash(:info, "Crossing created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

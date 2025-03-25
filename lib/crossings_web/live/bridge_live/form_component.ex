defmodule CrossingsWeb.BridgeLive.FormComponent do
  use CrossingsWeb, :live_component

  alias Crossings.Structure

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage bridge records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="bridge-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:structure_number]} type="text" label="Structure number" />
        <.input field={@form[:structure_name]} type="text" label="Structure name" />
        <.input field={@form[:shape]} type="text" label="Shape" />
        <.input field={@form[:type]} type="text" label="Type" />
        <.input field={@form[:length]} type="number" label="Length" step="any" />
        <.input field={@form[:diameter]} type="number" label="Diameter" />
        <.input field={@form[:width]} type="number" label="Width" />
        <.input field={@form[:height]} type="number" label="Height" />
        <.input field={@form[:cover_depth]} type="number" label="Cover depth" />
        <.input field={@form[:bci]} type="number" label="Bci" step="any" />
        <.input field={@form[:urgency]} type="number" label="Urgency" />
        <.input field={@form[:year_build]} type="number" label="Year build" />
        <.input field={@form[:last_inspected]} type="date" label="Last inspected" />
        <.input field={@form[:service_area_code]} type="number" label="Service area code" />
        <.input field={@form[:latitude]} type="number" label="Latitude" step="any" />
        <.input field={@form[:longitude]} type="number" label="Longitude" step="any" />
        <.input field={@form[:data_source]} type="text" label="Data source" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Bridge</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{bridge: bridge} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Structure.change_bridge(bridge))
     end)}
  end

  @impl true
  def handle_event("validate", %{"bridge" => bridge_params}, socket) do
    changeset = Structure.change_bridge(socket.assigns.bridge, bridge_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"bridge" => bridge_params}, socket) do
    save_bridge(socket, socket.assigns.action, bridge_params)
  end

  defp save_bridge(socket, :edit, bridge_params) do
    case Structure.update_bridge(socket.assigns.bridge, bridge_params) do
      {:ok, bridge} ->
        notify_parent({:saved, bridge})

        {:noreply,
         socket
         |> put_flash(:info, "Bridge updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_bridge(socket, :new, bridge_params) do
    case Structure.create_bridge(bridge_params) do
      {:ok, bridge} ->
        notify_parent({:saved, bridge})

        {:noreply,
         socket
         |> put_flash(:info, "Bridge created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end

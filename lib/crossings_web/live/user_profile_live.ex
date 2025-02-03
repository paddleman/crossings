defmodule CrossingsWeb.UserProfileLive do
  use CrossingsWeb, :live_view

  import CrossingsWeb.UserComponent

  alias Crossings.Accounts

  @impl true
  def mount(_params, _session, socket) do
    user = socket.assigns.current_user

    socket
    |> assign(:user, user)
    |> allow_upload(:avatar,
      accept: ~w(.png .jpg .webp),
      max_entries: 1,
      max_file_size: 2 * 1024 * 1024
    )
    |> ok()
  end

  def handle_event("submit-avatar", _, socket) do
    if socket.assigns.user.id != socket.assigns.current_user.id do
      raise "Prohibited"
    end

    avatar_path =
      socket
      |> consume_uploaded_entries(:avatar, fn %{path: path}, _entry ->
        dest = Path.join("priv/static/uploads", Path.basename(path))
        File.cp!(path, dest)
        {:ok, Path.basename(dest)}
      end)
      |> List.first()

    {:ok, _user} = Accounts.save_avatar_path(socket.assigns.current_user, avatar_path)
    {:noreply, socket}
  end

  def handle_event("validate-avatar", _, socket), do: {:noreply, socket}
end

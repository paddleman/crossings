defmodule CrossingsWeb.SplashLive do
  use CrossingsWeb, :live_view

  def mount(_params, _session, socket) do
    # socket = assign(socket, key: value)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-red-500 text-center">Splash Live</h1>
    """
  end
end

defmodule CrossingsWeb.HomeLive do
  use CrossingsWeb, :live_view

  alias Crossings.Accounts.User
  alias CrossingsWeb.UserComponent

  def render(assigns) do
    ~H"""
    <h1 class="text-center text-3-xl text-red-500 font-semibold">
      Welcome to Crossings
    </h1>
    """
  end
end

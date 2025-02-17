defmodule CrossingsWeb.UserComponent do
  use CrossingsWeb, :html

  alias Crossings.Accounts.User

  attr :user, User
  attr :rest, :global

  def user_card(assigns) do
    ~H"""
    <div class=" p-1  text-zinc-100 hover:opacity-50">
      <div class="flex items-center justify-center">
        <.user_avatar user={@user} class="w-12 h-12 rounded-full mr-6" />
        <div class="text-normal text-left">
          <p class="font-semibold">{@user.username}</p>
          <p class="font-thin">{@user.email}</p>
        </div>
      </div>
    </div>
    """
  end

  attr :user, User
  attr :rest, :global

  def user_avatar(assigns) do
    ~H"""
    <img data-user-avatar-id={"avatar-#{@user.id}"} src={user_avatar_path(@user)} {@rest} />
    """
  end

  defp user_avatar_path(user) do
    IO.inspect(user.avatar_url)

    if user.avatar_url == "/images/default-avatar.png" do
      user.avatar_url
    else
      "/uploads/#{user.avatar_url}"
    end
  end
end

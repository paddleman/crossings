defmodule CrossingsWeb.UserComponent do
  use CrossingsWeb, :html

  alias Crossings.Accounts.User

  attr :user, User
  attr :rest, :global

  def user_avatar(assigns) do
    ~H"""
    <img data-user-avatar-id={@user.id} src={user_avatar_path(@user)} {@rest} />
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

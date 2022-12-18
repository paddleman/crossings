defmodule Crossings.Repo do
  use Ecto.Repo,
    otp_app: :crossings,
    adapter: Ecto.Adapters.Postgres
end

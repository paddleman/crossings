defmodule Crossings.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CrossingsWeb.Telemetry,
      # Start the Ecto repository
      Crossings.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Crossings.PubSub},
      # Start Finch
      {Finch, name: Crossings.Finch},
      # Start the Endpoint (http/https)
      CrossingsWeb.Endpoint
      # Start a worker by calling: Crossings.Worker.start_link(arg)
      # {Crossings.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crossings.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrossingsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

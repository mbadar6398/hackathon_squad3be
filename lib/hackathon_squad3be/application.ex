defmodule HackathonSquad3be.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HackathonSquad3be.Repo,
      # Start the Telemetry supervisor
      HackathonSquad3beWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HackathonSquad3be.PubSub},
      # Start the Endpoint (http/https)
      HackathonSquad3beWeb.Endpoint
      # Start a worker by calling: HackathonSquad3be.Worker.start_link(arg)
      # {HackathonSquad3be.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HackathonSquad3be.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HackathonSquad3beWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

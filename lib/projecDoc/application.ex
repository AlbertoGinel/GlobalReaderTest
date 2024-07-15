defmodule ProjecDoc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ProjecDocWeb.Telemetry,
      ProjecDoc.Repo,
      {DNSCluster, query: Application.get_env(:projecDoc, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ProjecDoc.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ProjecDoc.Finch},
      # Start a worker by calling: ProjecDoc.Worker.start_link(arg)
      # {ProjecDoc.Worker, arg},
      # Start to serve requests, typically the last entry
      ProjecDocWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ProjecDoc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ProjecDocWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

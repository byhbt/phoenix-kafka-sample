defmodule ElixirKafka.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ElixirKafka.Repo,
      # Start the Telemetry supervisor
      ElixirKafkaWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirKafka.PubSub},
      # Start the Endpoint (http/https)
      ElixirKafkaWeb.Endpoint
      # Start a worker by calling: ElixirKafka.Worker.start_link(arg)
      # {ElixirKafka.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirKafka.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirKafkaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule GraphqlDojoSubscriptions.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      GraphqlDojoSubscriptions.Repo,
      {Phoenix.PubSub, name: GraphqlDojoSubscriptions.PubSub},
      GraphqlDojoSubscriptionsWeb.Endpoint,
      {Absinthe.Subscription, GraphqlDojoSubscriptionsWeb.Endpoint}
    ]

    opts = [strategy: :one_for_one, name: GraphqlDojoSubscriptions.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    GraphqlDojoSubscriptionsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

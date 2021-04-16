defmodule GraphqlDojoSubscriptionsWeb.UserSocket do
  use Phoenix.Socket
  use Absinthe.Phoenix.Socket, schema: GraphqlDojoSubscriptionsWeb.GraphQL.Schema

  @impl true
  def connect(_params, socket, _connect_info) do
    IO.inspect("connected to websocket")
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end

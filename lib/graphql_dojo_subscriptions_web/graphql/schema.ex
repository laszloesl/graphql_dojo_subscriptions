defmodule GraphqlDojoSubscriptionsWeb.GraphQL.Schema do
  use Absinthe.Schema

  query do
    field(:empty, :string)
  end

  subscription do
    field :send_me_stuff, :send_me_stuff_output do
      config(fn _args, _info ->
        {:ok, %{topic: "here_is_some_stuff"}}
      end)
    end
  end

  object :send_me_stuff_output do
    field(:stuff, non_null(:string))
  end

  def context(context) do
    Map.put(context, :context, %{pubsub: GraphqlDojoSubscriptions.PubSub})
  end
end

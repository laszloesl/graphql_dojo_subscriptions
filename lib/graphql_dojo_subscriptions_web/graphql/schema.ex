defmodule GraphqlDojoSubscriptionsWeb.GraphQL.Schema do
  use Absinthe.Schema
  import_types(GraphqlDojoSubscriptionsWeb.GraphQL.Schema.BlogPost)

  query do
    import_fields(:blog_post_queries)
  end

  mutation do
    import_fields(:blog_post_mutations)
  end

  def context(context) do
    Map.put(context, :context, %{pubsub: GraphqlDojoSubscriptions.PubSub})
  end
end

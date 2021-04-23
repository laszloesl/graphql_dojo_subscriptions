defmodule GraphqlDojoSubscriptionsWeb.GraphQL.Schema.BlogPost do
  use Absinthe.Schema.Notation

  object :blog_post do
    field(:id, non_null(:string))
    field(:author, non_null(:string))
    field(:title, non_null(:string))
    field(:text, non_null(:string))
  end

  object :blog_post_queries do
    field :get_blog_post, :blog_post do
      arg(:id, non_null(:string))

      resolve(fn %{id: id}, _resolution ->
        {:ok, GraphqlDojoSubscriptions.BlogPost.get(id)}
      end)
    end
  end

  object :blog_post_mutations do
    field :create_blog_post, :blog_post do
      arg(:title, non_null(:string))
      arg(:author, non_null(:string))
      arg(:text, non_null(:string))

      resolve(fn args, _resolution ->
        GraphqlDojoSubscriptions.BlogPost.insert(args)
      end)
    end
  end
end

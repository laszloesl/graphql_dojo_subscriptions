defmodule GraphqlDojoSubscriptionsWeb.Router do
  use GraphqlDojoSubscriptionsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: GraphqlDojoSubscriptionsWeb.GraphQL.Schema

    forward "/", Absinthe.Plug, schema: GraphqlDojoSubscriptionsWeb.GraphQL.Schema
  end
end

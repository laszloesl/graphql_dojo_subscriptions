defmodule GraphqlDojoSubscriptions.Repo do
  use Ecto.Repo,
    otp_app: :graphql_dojo_subscriptions,
    adapter: Ecto.Adapters.Postgres
end

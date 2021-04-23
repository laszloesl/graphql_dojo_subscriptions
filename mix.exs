defmodule GraphqlDojoSubscriptions.MixProject do
  use Mix.Project

  def project do
    [
      app: :graphql_dojo_subscriptions,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {GraphqlDojoSubscriptions.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:absinthe, "~> 1.6"},
      {:absinthe_phoenix, "~> 2.0"},
      {:ecto, "~> 3.6"},
      {:ecto_sql, "~> 3.6"},
      {:jason, "~> 1.0"},
      {:phoenix, "~> 1.5.7"},
      {:postgrex, ">= 0.0.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end

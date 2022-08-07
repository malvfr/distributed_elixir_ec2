defmodule DistributedEc2.MixProject do
  use Mix.Project

  def project do
    [
      app: :distributed_ec2,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :mix],
      mod: {DistributedEc2, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libcluster, "~> 3.3.1"},
      {:libcluster_ec2, "~> 0.5"}
    ]
  end
end

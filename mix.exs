defmodule EvercraftElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app: :evercraft_elixir,
      version: "0.0.1",
      elixir: "~> 1.1",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      dialyzer: [
        paths: [
          "_build/dev/lib/algae/ebin/"
        ]
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:dialyxir, "~> 0.3", only: [:dev]},
      {:algae, "~> 0.9.0"},
      {:vex, git: "https://github.com/CargoSense/vex.git", tag: "v0.5.5"}
    ]
  end
end

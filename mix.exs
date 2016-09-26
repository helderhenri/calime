defmodule Calime.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :calime,
     build_embedded: Mix.env == :prod,
     deps: deps,
     description: """
     An Elixir library for rendering Slim-like templates and Canjs.
     """,
     elixir: "~> 1.0",
     package: package,
     source_url: "https://github.com/helderhenri/calime",
     start_permanent: Mix.env == :prod,
     version: @version]
  end

  def application do
    [applications: [:eex]]
  end

  def package do
    [
      maintainers: [
        "Helder de Sousa",
      ],
      files: ["lib", "mix.exs", "README*"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/helderhenri/calime"},
    ]
  end

  def deps do
    [
      # Benchmarking tool
      {:benchfella, "~> 0.3", only: ~w(dev test)a},
      # Documentation
      {:ex_doc, "~> 0.12", only: :dev},
      # Automatic test runner
      {:mix_test_watch, ">= 0.0.0", only: :dev},
      # Style linter
      {:credo, ">= 0.0.0", only: ~w(dev test)a},
      # HTML generation helpers
      {:phoenix_html, "~> 2.2", only: :test},
      # Ofusca JS
      {:ofusca_js, github: "helderhenri/ofusca_js", branch: "master"}
    ]
  end
end

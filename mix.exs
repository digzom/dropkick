defmodule Dropkick.MixProject do
  use Mix.Project

  @version "0.0.0"
  @url "https://github.com/thiagomajesk/dropkick"

  def project do
    [
      app: :dropkick,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps(),
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
      xref: [exclude: [:hackney_request]]
    ]
  end

  defp description() do
    """
    Easy file uploads for Elixir/Phoenix
    """
  end

  defp package do
    [
      maintainers: ["Thiago Majesk Goulart"],
      licenses: ["AGPL-3.0-only"],
      links: %{"GitHub" => @url},
      files: ~w(lib mix.exs README.md)
    ]
  end

  defp docs() do
    [
      source_ref: "v#{@version}",
      main: "README",
      canonical: "http://hexdocs.pm/dropkick",
      source_url: @url,
      extras: [
        "README.md": [filename: "README"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Dropkick.Application, []},
      extra_applications: [:logger, :inets]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.0"},
      {:ecto, "~> 3.0"},
      {:plug, "~> 1.0"},
      {:exvcr, "~> 0.13.5", only: :test},
      {:image, "~> 0.30.0"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:mime, "~> 2.0"},
      {:ex_image_info, "~> 0.2.4"}
    ]
  end
end

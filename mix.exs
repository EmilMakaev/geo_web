defmodule GeoWeb.MixProject do
  use Mix.Project

  def project do
    [
      app: :geo_web,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Start, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.0"},
      {:geo, git: "https://github.com/EmilMakaev/geo.git"}
    ]
  end
end

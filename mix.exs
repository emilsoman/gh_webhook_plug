defmodule GhWebhookPlug.Mixfile do
  use Mix.Project

  def project do
    [app: :gh_webhook_plug,
     version: "0.0.4",
     elixir: "~> 1.5",
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [{:plug, "~>1.4"}]
  end

  defp description do
    """
    This Plug makes it easy to listen and respond to Github webhook requests
    in your Elixir apps.
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Emil Soman"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/emilsoman/gh_webhook_plug"}]
  end
end

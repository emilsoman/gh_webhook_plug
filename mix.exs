defmodule GhWebhookPlug.Mixfile do
  use Mix.Project

  def project do
    [app: :gh_webhook_plug,
     version: "0.0.5",
     elixir: "~> 1.5",
     description: description(),
     package: package(),
     deps: deps(),
     docs: docs()]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:plug, "~>1.4"},
      {:ex_doc, "~> 0.3", only: :dev}
    ]
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

  defp docs do
    [extras: ["README.md"]]
  end
end

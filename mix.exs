defmodule GhWebhookPlug.Mixfile do
  use Mix.Project

  def project do
    [app: :gh_webhook_plug,
     version: "0.0.3",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:plug, :logger]
    ]
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
    [{:plug, "~>1.1.0"}]
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

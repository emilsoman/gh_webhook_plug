# GhWebhookPlug

This Plug makes it easy to listen to Github webhook requests in your Elixir
and Phoenix apps and trigger actions.

Features:

* Configurable HTTP endpoint
* Verifies authenticity using webhook secret
* Responses are handled for you - just write business logic

## Installation

Add gh_webhook_plug to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:gh_webhook_plug, "~> 0.0.5"}]
end
```

## Usage

Inside a phoenix app, add this line in the Endpoint module:

```elixir
defmodule MyApp.Endpoint do

  # Add this line above Plug.Parsers plug:
  plug GhWebhookPlug,
    secret: "secret",
    path: "/github_webhook",
    action: {MyApp.GithubWebhook, :handle}

  # Rest of the plugs
end
```

Now you can write the handler like this:

```elixir
defmodule MyApp.GithubWebhook do
  def handle(conn, payload) do
    # Handle webhook payload here
    # Return value of this function is ignored
  end
end
```

## Configuration

Add this to your configuration file (`config/config.exs`):

```elixir
config :gh_webhook_plug,
  # Secret set in webhook settings page of the Github repository
  secret: "foobar",
  # Path that will be intercepted by GhWebhookPlug
  path: "/api/github_webhook",
  # Module and function that will be used to handle the webhook payload
  action: {MyApp.GithubWebhook, :handle}
```

These configurations can also be set via options to the plug as shown in the
example in the Usage section.

## License

MIT

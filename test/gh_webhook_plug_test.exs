defmodule GhWebhookPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  # Demo plug with basic auth and a simple index action
  defmodule DemoPlug do
    use Plug.Builder

    plug GhWebhookPlug, secret: "secret", path: "/gh-webhook", action: {__MODULE__, :'gh_webhook'}
    plug :next_in_chain

    def gh_webhook(payload) do
      Process.put(:payload, payload)
    end

    def next_in_chain(conn, _opts) do
      Process.put(:next_in_chain_called, true)
      conn |> send_resp(200, "OK") |> halt
    end
  end

  test "when verification fails, returns a 403" do
    conn = conn(:get, "/gh-webhook", "hello world") |> put_req_header("x-hub-signature", "sha1=wrong_hexdigest")
    |> DemoPlug.call([])

    assert conn.status == 403
    assert Process.get(:payload) == nil
    assert !Process.get(:next_in_chain_called)
  end

  test "when payload is verified, returns a 200" do
    hexdigest = "sha1=" <> (:crypto.hmac(:sha, "secret", "hello world") |> Base.encode16(case: :lower))
    conn = conn(:get, "/gh-webhook", "hello world") |> put_req_header("x-hub-signature", hexdigest)
    |> DemoPlug.call([])

    assert conn.status == 200
    assert Process.get(:payload) == "hello world"
    assert !Process.get(:next_in_chain_called)
  end

  test "when path does not match, skips this plug and proceeds to next one" do
    conn = conn(:get, "/hello")
    |> DemoPlug.call([])

    assert conn.status == 200
    assert !Process.get(:payload)
    assert Process.get(:next_in_chain_called)
  end
end

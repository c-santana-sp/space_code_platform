defmodule SpaceCodePlatformWeb.PilotsController do
  use SpaceCodePlatformWeb, :controller

  action_fallback SpaceCodePlatformWeb.FallbackController

  def show(conn, %{"id" => id}) do
    id
    |> SpaceCodePlatform.fetch_pilot()
    |> handle_response(conn, "fetch.json", :ok)
  end

  defp handle_response({:ok, pilot}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pilot: pilot)
  end
  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end

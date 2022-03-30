defmodule SpaceCodePlatformWeb.ShipsController do
  use SpaceCodePlatformWeb, :controller

  action_fallback SpaceCodePlatformWeb.FallbackController

  def create(conn, params) do
    params
    |> SpaceCodePlatform.create_ship()
    |> handle_response(conn, "create.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> SpaceCodePlatform.fetch_ship()
    |> handle_response(conn, "fetch.json", :ok)
  end

  defp handle_response({:ok, ship}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, ship: ship)
  end
  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end

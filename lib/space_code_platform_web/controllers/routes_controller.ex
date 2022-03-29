defmodule SpaceCodePlatformWeb.RoutesController do
  use SpaceCodePlatformWeb, :controller

  action_fallback SpaceCodePlatformWeb.FallbackController

  def show(conn, %{"id" => id}) do
    id
    |> SpaceCodePlatform.fetch_route()
    |> handle_response(conn, "fetch.json", :ok)
  end

  defp handle_response({:ok, route}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, route: route)
  end
  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end

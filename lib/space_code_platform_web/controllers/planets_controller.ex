defmodule SpaceCodePlatformWeb.PlanetsController do
  use SpaceCodePlatformWeb, :controller

  action_fallback SpaceCodePlatformWeb.FallbackController

  def create(conn, params) do
    params
    |> SpaceCodePlatform.create_planet()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> SpaceCodePlatform.fetch_planet()
    |> handle_response(conn, "fetch.json", :ok)
  end

  defp handle_response({:ok, planet}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, planet: planet)
  end
  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end

defmodule SpaceCodePlatformWeb.GoodsController do
  use SpaceCodePlatformWeb, :controller

  action_fallback SpaceCodePlatformWeb.FallbackController

  def create(conn, params) do
    params
    |> SpaceCodePlatform.create_good()
    |> handle_response(conn, "create.json", :created)
  end

  defp handle_response({:ok, good}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, good: good)
  end
  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end

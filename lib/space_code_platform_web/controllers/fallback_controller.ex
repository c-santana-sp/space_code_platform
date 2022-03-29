defmodule SpaceCodePlatformWeb.FallbackController do
  use SpaceCodePlatformWeb, :controller

  action_fallback SpaceCodePlatformWeb.FallbackController

  def call(conn, {:error, reason}) do
    conn
    |> put_status(:bad_request)
    |> put_view(SpaceCodePlatformWeb.ErrorView)
    |> render("400.json", result: reason)
  end

end

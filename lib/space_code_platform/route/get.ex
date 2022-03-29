defmodule SpaceCodePlatform.Route.Get do

  alias SpaceCodePlatform.{Route, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid id format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Route, uuid) do
      nil -> {:error, "Route not found"}
      route -> {:ok, route}
    end
  end
end

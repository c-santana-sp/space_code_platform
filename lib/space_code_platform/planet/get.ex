defmodule SpaceCodePlatform.Planet.Get do

  alias SpaceCodePlatform.{Planet, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid id format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Planet, uuid) do
      nil -> {:error, "Planet not found"}
      planet -> {:ok, planet}
    end
  end
end

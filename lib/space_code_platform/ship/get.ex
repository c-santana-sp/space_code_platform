defmodule SpaceCodePlatform.Ship.Get do

  alias SpaceCodePlatform.{Ship, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid id format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Ship, uuid) do
      nil -> {:error, "Ship not found"}
      ship -> {:ok, ship}
    end
  end
end

defmodule SpaceCodePlatform.Pilot.Get do

  alias SpaceCodePlatform.{Pilot, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid id format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Pilot, uuid) do
      nil -> {:error, "Pilot not found"}
      pilot -> {:ok, pilot}
    end
  end
end

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
      pilot ->
        age = pilot |> calculate_age()
        pilot_with_age = pilot |> Map.put(:age, age)
        {:ok, pilot_with_age}
    end
  end

  def calculate_age(%Pilot{date_of_birth: date_of_birth}) do
    Date.utc_today()
    |> Date.diff(date_of_birth)
    |> div(365)
  end
end

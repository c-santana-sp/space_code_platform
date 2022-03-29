defmodule SpaceCodePlatform.Pilot.Create do

  alias SpaceCodePlatform.{Pilot, Repo}

  def call(params) do
    params
    |> Pilot.build()
    |> create_pilot()
  end

  defp create_pilot({:ok, struct}), do: Repo.insert(struct)
  defp create_pilot({:error, _changeset} = error), do: error
end

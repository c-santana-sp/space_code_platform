defmodule SpaceCodePlatform.Planet.Create do

  alias SpaceCodePlatform.Planet
  alias SpaceCodePlatform.Repo

  def call(params) do
    params
    |> Planet.build()
    |> create_planet()
  end

  defp create_planet({:ok, struct}), do: Repo.insert(struct)
  defp create_planet({:error, _changeset} = error), do: error
end

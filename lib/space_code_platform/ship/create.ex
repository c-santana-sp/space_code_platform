defmodule SpaceCodePlatform.Ship.Create do

  alias SpaceCodePlatform.{Repo, Ship}

  def call(params) do
    params
    |> Ship.build()
    |> create_ship()
  end

  defp create_ship({:ok, struct}), do: Repo.insert(struct)
  defp create_ship({:error, _changeset} = error), do: error
end

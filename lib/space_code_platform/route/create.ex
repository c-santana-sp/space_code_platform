defmodule SpaceCodePlatform.Route.Create do

  alias SpaceCodePlatform.Route
  alias SpaceCodePlatform.Repo

  def call(params) do
    params
    |> Route.build()
    |> create_route()
  end

  defp create_route({:ok, struct}), do: Repo.insert(struct)
  defp create_route({:error, _changeset} = error), do: error
end

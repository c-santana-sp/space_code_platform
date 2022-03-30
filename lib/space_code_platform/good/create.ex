defmodule SpaceCodePlatform.Good.Create do

  alias SpaceCodePlatform.{Good, Repo}

  def call(params) do
    params
    |> Good.build()
    |> create_good()
  end

  defp create_good({:ok, struct}), do: Repo.insert(struct)
  defp create_good({:error, _changeset} = error), do: error
end

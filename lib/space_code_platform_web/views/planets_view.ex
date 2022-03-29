defmodule SpaceCodePlatformWeb.PlanetsView do
  use SpaceCodePlatformWeb, :view

  alias SpaceCodePlatform.Planet

  def render("create.json", %{planet: %Planet{
    id: id,
    name: name,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
      %{
        message: "Planet Created!",
        planet: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }
  end

  def render("fetch.json", %{planet: %Planet{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}}) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

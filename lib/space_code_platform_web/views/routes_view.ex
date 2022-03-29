defmodule SpaceCodePlatformWeb.RoutesView do
  use SpaceCodePlatformWeb, :view

  alias SpaceCodePlatform.Route

  def render("fetch.json", %{route: %Route{
    id: id,
    fuel_cost: fuel_cost,
    is_available: is_available,
    origin_planet_id: origin_planet_id,
    destination_planet_id: destination_planet_id,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
      %{
      id: id,
      fuel_cost: fuel_cost,
      is_available: is_available,
      origin_planet_id: origin_planet_id,
      destination_planet_id: destination_planet_id,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

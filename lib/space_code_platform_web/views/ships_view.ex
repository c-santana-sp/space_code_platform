defmodule SpaceCodePlatformWeb.ShipsView do
  use SpaceCodePlatformWeb, :view

  alias SpaceCodePlatform.Ship

  def render("create.json", %{ship: %Ship{
    id: id,
    fuel_capacity: fuel_capacity,
    fuel_level: fuel_level,
    weight_capacity: weight_capacity,
    pilot_id: pilot_id,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
      %{
        message: "Ship Created!",
        ship: %{
          id: id,
          fuel_capacity: fuel_capacity,
          fuel_level: fuel_level,
          weight_capacity: weight_capacity,
          pilot_id: pilot_id,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }
  end

  def render("fetch.json", %{ship: %Ship{
    id: id,
    fuel_capacity: fuel_capacity,
    fuel_level: fuel_level,
    weight_capacity: weight_capacity,
    pilot_id: pilot_id,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
    %{
      id: id,
      fuel_capacity: fuel_capacity,
      fuel_level: fuel_level,
      weight_capacity: weight_capacity,
      pilot_id: pilot_id,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

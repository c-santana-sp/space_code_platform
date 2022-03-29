defmodule SpaceCodePlatformWeb.PilotsView do
  use SpaceCodePlatformWeb, :view

  alias SpaceCodePlatform.Pilot

  def render("create.json", %{pilot: %Pilot{
    id: id,
    name: name,
    pilot_certification: pilot_certification,
    credits: credits,
    age: age,
    location_planet_id: location_planet_id,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
    %{
      id: id,
      name: name,
      pilot_certification: pilot_certification,
      credits: credits,
      age: age,
      location_planet_id: location_planet_id,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end

  def render("fetch.json", %{pilot: %Pilot{
    id: id,
    name: name,
    pilot_certification: pilot_certification,
    age: age,
    credits: credits,
    location_planet_id: location_planet_id,
    # ship: ship,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
    %{
      id: id,
      name: name,
      pilot_certification: pilot_certification,
      age: age,
      credits: credits,
      location_planet_id: location_planet_id,
      # ship: ship,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

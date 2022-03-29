defmodule SpaceCodePlatformWeb.PilotsView do
  use SpaceCodePlatformWeb, :view

  alias SpaceCodePlatform.Pilot

  def render("fetch.json", %{pilot: %Pilot{
    id: id,
    name: name,
    pilot_certification: pilot_certification,
    age: age,
    credits: credits,
    location_planet: location_planet,
    ship: ship,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
    %{
      id: id,
      name: name,
      pilot_certification: pilot_certification,
      age: age,
      credits: credits,
      location_planet: location_planet,
      ship: ship,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

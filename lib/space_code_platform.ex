defmodule SpaceCodePlatform do

  alias SpaceCodePlatform.{Good, Pilot, Planet, Route, Ship}

  @moduledoc """
  SpaceCodePlatform keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_planet(params), to: Planet.Create, as: :call
  defdelegate fetch_planet(params), to: Planet.Get, as: :call

  defdelegate create_route(params), to: Route.Create, as: :call
  defdelegate fetch_route(params), to: Route.Get, as: :call

  defdelegate create_pilot(params), to: Pilot.Create, as: :call
  defdelegate fetch_pilot(params), to: Pilot.Get, as: :call

  defdelegate create_ship(params), to: Ship.Create, as: :call
  defdelegate fetch_ship(params), to: Ship.Get, as: :call

  defdelegate create_good(params), to: Good.Create, as: :call

end

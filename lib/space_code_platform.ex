defmodule SpaceCodePlatform do

  alias SpaceCodePlatform.{Pilot, Planet, Route}

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

  defdelegate fetch_pilot(params), to: Pilot.Get, as: :call
end

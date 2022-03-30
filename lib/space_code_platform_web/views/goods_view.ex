defmodule SpaceCodePlatformWeb.GoodsView do
  use SpaceCodePlatformWeb, :view

  alias SpaceCodePlatform.Good

  def render("create.json", %{good: %Good{
    id: id,
    name: name,
    inserted_at: inserted_at,
    updated_at: updated_at}}) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end

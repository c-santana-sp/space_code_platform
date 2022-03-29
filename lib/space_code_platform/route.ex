defmodule SpaceCodePlatform.Route do

  use Ecto.Schema
  import Ecto.Changeset

  alias SpaceCodePlatform.Planet

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_fields [:fuel_cost, :is_available, :origin_planet_id, :destination_planet_id]
  schema "routes" do
    field :fuel_cost, :float
    field :is_available, :boolean
    belongs_to :origin_planet, Planet, references: :id
    belongs_to :destination_planet, Planet, references: :id
    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> assoc_constraint(:origin_planet)
    |> assoc_constraint(:destination_planet)
  end
end

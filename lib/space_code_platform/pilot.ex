defmodule SpaceCodePlatform.Pilot do
  use Ecto.Schema
  import Ecto.Changeset

  alias SpaceCodePlatform.{Ship, Planet}

  # @derive Jason.Encoder
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_fields [:name, :pilot_certification, :date_of_birth, :credits, :location_planet_id]
  schema "pilots" do
    field :name, :string
    field :pilot_certification, :string
    field :date_of_birth, :date
    field :age, :integer, virtual: true
    field :credits, :float
    belongs_to :location_planet, Planet
    has_one :ship, Ship
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
    # |> calculate_age()
    |> assoc_constraint(:location_planet)
    # |> validate_number(:age, min: 18)
    |> unique_constraint([:pilot_certification])
  end
end

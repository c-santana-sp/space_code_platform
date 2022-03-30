defmodule SpaceCodePlatform.Ship do
  use Ecto.Schema
  import Ecto.Changeset

  alias SpaceCodePlatform.Pilot

  @derive Jason.Encoder
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  @required_fields [:fuel_capacity, :fuel_level, :weight_capacity, :pilot_id]
  schema "ships" do
    field :fuel_capacity, :float
    field :fuel_level, :float
    field :weight_capacity, :float
    belongs_to :pilot, Pilot, references: :id
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
    |> assoc_constraint(:pilot)
    |> unique_constraint(:pilot, name: :unique_pilot_id)
  end
end

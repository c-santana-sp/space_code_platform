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
    |> assoc_constraint(:location_planet)
    |> fill_age()
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:pilot_certification)
  end

  defp fill_age(%Ecto.Changeset{valid?: true, changes: %{date_of_birth: date_of_birth}} = changeset) do
    age = Date.utc_today()
      |> Date.diff(date_of_birth)
      |> div(365)
    change(changeset, age: age)
  end
  defp fill_age(%Ecto.Changeset{valid?: false, changes: _changes} = changeset), do: changeset
end

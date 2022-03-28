defmodule SpaceCodePlatform.Planet do
  use Ecto.Schema
  import Ecto.Changeset

  alias SpaceCodePlatform.Route

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_fields [:name]
  schema "planets" do
    field :name, :string
    has_many :routes, Route
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
  end
end

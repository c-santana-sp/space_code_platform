defmodule SpaceCodePlatform.Good do
  use Ecto.Schema
  import Ecto.Changeset

  @derive Jason.Encoder
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @required_fields [:name]
  schema "goods" do
    field :name, :string
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
    |> put_name_downcase()
  end

  defp put_name_downcase(%Ecto.Changeset{valid?: true, changes: %{name: name}} = changeset) do
    changeset
    |> change(name: String.downcase(name))
  end
  defp put_name_downcase(changeset), do: changeset
end

defmodule SpaceCodePlatform.Repo.Migrations.AddGoodsTable do
  use Ecto.Migration

  def change do
    create table(:goods, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      timestamps()
    end
  end
end

defmodule SpaceCodePlatform.Repo.Migrations.AddShipsTable do
  use Ecto.Migration

  def change do
    create table(:ships, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :fuel_capacity, :float
      add :fuel_level, :float
      add :weight_capacity, :float
      add :pilot_id, references(:pilots, type: :uuid), null: false
      timestamps()
    end
  end
end

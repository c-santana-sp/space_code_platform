defmodule SpaceCodePlatform.Repo.Migrations.AddRoutesTable do
  use Ecto.Migration

  def change do
    create table(:routes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :fuel_cost, :float
      add :is_available, :boolean
      add :origin_planet_id, references(:planets, type: :uuid), null: false
      add :destination_planet_id, references(:planets, type: :uuid), null: false
      timestamps()
    end
  end
end

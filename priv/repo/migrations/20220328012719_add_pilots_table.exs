defmodule SpaceCodePlatform.Repo.Migrations.AddPilotsTable do
  use Ecto.Migration

  def change do
    create table(:pilots, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :pilot_certification, :string
      add :date_of_birth, :date
      add :credits, :float
      add :location_planet_id, references(:planets, type: :uuid), null: false
      timestamps()
    end
  end
end

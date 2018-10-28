defmodule SeaTraders.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :name, :string, null: false
      add :longitude, :float, null: false
      add :latitude, :float, null: false

      timestamps()
    end
  end
end

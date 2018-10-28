defmodule SeaTraders.Ships.Ship do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ships" do
    field :name, :string
    field :departed_at, :utc_datetime
    field :estimated_arrival_at, :utc_datetime
    belongs_to :anchorage, SeaTraders.Cities.City
    belongs_to :destination, SeaTraders.Cities.City

    timestamps()
  end

  @doc false
  def changeset(ship, attrs) do
    ship
    |> cast(attrs, [:name, :departed_at, :estimated_arrival_at, :anchorage_id])
    |> validate_required([:name])
  end
end

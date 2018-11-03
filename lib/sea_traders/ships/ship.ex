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

  @doc false
  def send_to_city_changeset(ship, attrs) do
    ship
    |> cast(attrs, [:destination_id])
    |> validate_required([:destination_id])
    |> put_change(:anchorage_id, nil)
    |> put_change(:departed_at, NaiveDateTime.utc_now)
    |> put_change(:estimated_arrival_at, estimated_time_of_arrival())
  end

  defp estimated_time_of_arrival do
    NaiveDateTime.utc_now
    |> NaiveDateTime.add(120)
  end
end

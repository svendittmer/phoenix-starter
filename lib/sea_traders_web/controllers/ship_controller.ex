defmodule SeaTradersWeb.ShipController do
  use SeaTradersWeb, :controller

  alias SeaTraders.Ships
  alias SeaTraders.Ships.Ship

  def index(conn, _params) do
    ships = Ships.list_ships()
    render(conn, "index.html", ships: ships)
  end

  def send(conn, %{"id" => id, "ship" => ship_params}) do
    ship = Ships.get_ship!(id)

    case Ships.send_ship_to_city(ship, ship_params) do
      {:ok, ship} ->
        conn
        |> put_flash(:info, "Ship sent to city.")
        |> redirect(to: ship_path(conn, :show, ship))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "show.html", ship: ship, changeset: changeset)
    end
  end

  def new(conn, _params) do
    changeset = Ships.change_ship(%Ship{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ship" => ship_params}) do
    case Ships.create_ship(ship_params) do
      {:ok, ship} ->
        conn
        |> put_flash(:info, "Ship created successfully.")
        |> redirect(to: ship_path(conn, :show, ship))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ship = Ships.get_ship!(id)
    changeset = Ships.change_ship(ship)
    render(conn, "show.html", ship: ship, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    ship = Ships.get_ship!(id)
    changeset = Ships.change_ship(ship)
    render(conn, "edit.html", ship: ship, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ship" => ship_params}) do
    ship = Ships.get_ship!(id)

    case Ships.update_ship(ship, ship_params) do
      {:ok, ship} ->
        conn
        |> put_flash(:info, "Ship updated successfully.")
        |> redirect(to: ship_path(conn, :show, ship))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ship: ship, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ship = Ships.get_ship!(id)
    {:ok, _ship} = Ships.delete_ship(ship)

    conn
    |> put_flash(:info, "Ship deleted successfully.")
    |> redirect(to: ship_path(conn, :index))
  end
end

defmodule SeaTraders.ShipsTest do
  use SeaTraders.DataCase

  alias SeaTraders.Ships

  describe "ships" do
    alias SeaTraders.Ships.Ship

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def ship_fixture(attrs \\ %{}) do
      {:ok, ship} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ships.create_ship()

      ship
    end

    test "list_ships/0 returns all ships" do
      ship = ship_fixture()
      assert Ships.list_ships() == [ship]
    end

    test "get_ship!/1 returns the ship with given id" do
      ship = ship_fixture()
      assert Ships.get_ship!(ship.id) == ship
    end

    test "create_ship/1 with valid data creates a ship" do
      assert {:ok, %Ship{} = ship} = Ships.create_ship(@valid_attrs)
      assert ship.name == "some name"
    end

    test "create_ship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ships.create_ship(@invalid_attrs)
    end

    test "update_ship/2 with valid data updates the ship" do
      ship = ship_fixture()
      assert {:ok, ship} = Ships.update_ship(ship, @update_attrs)
      assert %Ship{} = ship
      assert ship.name == "some updated name"
    end

    test "update_ship/2 with invalid data returns error changeset" do
      ship = ship_fixture()
      assert {:error, %Ecto.Changeset{}} = Ships.update_ship(ship, @invalid_attrs)
      assert ship == Ships.get_ship!(ship.id)
    end

    test "delete_ship/1 deletes the ship" do
      ship = ship_fixture()
      assert {:ok, %Ship{}} = Ships.delete_ship(ship)
      assert_raise Ecto.NoResultsError, fn -> Ships.get_ship!(ship.id) end
    end

    test "change_ship/1 returns a ship changeset" do
      ship = ship_fixture()
      assert %Ecto.Changeset{} = Ships.change_ship(ship)
    end
  end
end

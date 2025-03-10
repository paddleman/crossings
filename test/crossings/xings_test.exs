defmodule Crossings.XingsTest do
  use Crossings.DataCase

  alias Crossings.Xings

  describe "crossings" do
    alias Crossings.Xings.Crossing

    import Crossings.XingsFixtures

    @invalid_attrs %{}

    test "list_crossings/0 returns all crossings" do
      crossing = crossing_fixture()
      assert Xings.list_crossings() == [crossing]
    end

    test "get_crossing!/1 returns the crossing with given id" do
      crossing = crossing_fixture()
      assert Xings.get_crossing!(crossing.id) == crossing
    end

    test "create_crossing/1 with valid data creates a crossing" do
      valid_attrs = %{}

      assert {:ok, %Crossing{} = crossing} = Xings.create_crossing(valid_attrs)
    end

    test "create_crossing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Xings.create_crossing(@invalid_attrs)
    end

    test "update_crossing/2 with valid data updates the crossing" do
      crossing = crossing_fixture()
      update_attrs = %{}

      assert {:ok, %Crossing{} = crossing} = Xings.update_crossing(crossing, update_attrs)
    end

    test "update_crossing/2 with invalid data returns error changeset" do
      crossing = crossing_fixture()
      assert {:error, %Ecto.Changeset{}} = Xings.update_crossing(crossing, @invalid_attrs)
      assert crossing == Xings.get_crossing!(crossing.id)
    end

    test "delete_crossing/1 deletes the crossing" do
      crossing = crossing_fixture()
      assert {:ok, %Crossing{}} = Xings.delete_crossing(crossing)
      assert_raise Ecto.NoResultsError, fn -> Xings.get_crossing!(crossing.id) end
    end

    test "change_crossing/1 returns a crossing changeset" do
      crossing = crossing_fixture()
      assert %Ecto.Changeset{} = Xings.change_crossing(crossing)
    end
  end
end

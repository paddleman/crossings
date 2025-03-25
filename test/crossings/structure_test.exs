defmodule Crossings.StructureTest do
  use Crossings.DataCase

  alias Crossings.Structure

  describe "bridges" do
    alias Crossings.Structure.Bridge

    import Crossings.StructureFixtures

    @invalid_attrs %{type: nil, length: nil, width: nil, structure_number: nil, structure_name: nil, shape: nil, diameter: nil, height: nil, cover_depth: nil, bci: nil, urgency: nil, year_build: nil, last_inspected: nil, service_area_code: nil, latitude: nil, longitude: nil, data_source: nil}

    test "list_bridges/0 returns all bridges" do
      bridge = bridge_fixture()
      assert Structure.list_bridges() == [bridge]
    end

    test "get_bridge!/1 returns the bridge with given id" do
      bridge = bridge_fixture()
      assert Structure.get_bridge!(bridge.id) == bridge
    end

    test "create_bridge/1 with valid data creates a bridge" do
      valid_attrs = %{type: "some type", length: 120.5, width: 42, structure_number: "some structure_number", structure_name: "some structure_name", shape: "some shape", diameter: 42, height: 42, cover_depth: 42, bci: 120.5, urgency: 42, year_build: 42, last_inspected: ~D[2025-03-22], service_area_code: 42, latitude: 120.5, longitude: 120.5, data_source: "some data_source"}

      assert {:ok, %Bridge{} = bridge} = Structure.create_bridge(valid_attrs)
      assert bridge.type == "some type"
      assert bridge.length == 120.5
      assert bridge.width == 42
      assert bridge.structure_number == "some structure_number"
      assert bridge.structure_name == "some structure_name"
      assert bridge.shape == "some shape"
      assert bridge.diameter == 42
      assert bridge.height == 42
      assert bridge.cover_depth == 42
      assert bridge.bci == 120.5
      assert bridge.urgency == 42
      assert bridge.year_build == 42
      assert bridge.last_inspected == ~D[2025-03-22]
      assert bridge.service_area_code == 42
      assert bridge.latitude == 120.5
      assert bridge.longitude == 120.5
      assert bridge.data_source == "some data_source"
    end

    test "create_bridge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Structure.create_bridge(@invalid_attrs)
    end

    test "update_bridge/2 with valid data updates the bridge" do
      bridge = bridge_fixture()
      update_attrs = %{type: "some updated type", length: 456.7, width: 43, structure_number: "some updated structure_number", structure_name: "some updated structure_name", shape: "some updated shape", diameter: 43, height: 43, cover_depth: 43, bci: 456.7, urgency: 43, year_build: 43, last_inspected: ~D[2025-03-23], service_area_code: 43, latitude: 456.7, longitude: 456.7, data_source: "some updated data_source"}

      assert {:ok, %Bridge{} = bridge} = Structure.update_bridge(bridge, update_attrs)
      assert bridge.type == "some updated type"
      assert bridge.length == 456.7
      assert bridge.width == 43
      assert bridge.structure_number == "some updated structure_number"
      assert bridge.structure_name == "some updated structure_name"
      assert bridge.shape == "some updated shape"
      assert bridge.diameter == 43
      assert bridge.height == 43
      assert bridge.cover_depth == 43
      assert bridge.bci == 456.7
      assert bridge.urgency == 43
      assert bridge.year_build == 43
      assert bridge.last_inspected == ~D[2025-03-23]
      assert bridge.service_area_code == 43
      assert bridge.latitude == 456.7
      assert bridge.longitude == 456.7
      assert bridge.data_source == "some updated data_source"
    end

    test "update_bridge/2 with invalid data returns error changeset" do
      bridge = bridge_fixture()
      assert {:error, %Ecto.Changeset{}} = Structure.update_bridge(bridge, @invalid_attrs)
      assert bridge == Structure.get_bridge!(bridge.id)
    end

    test "delete_bridge/1 deletes the bridge" do
      bridge = bridge_fixture()
      assert {:ok, %Bridge{}} = Structure.delete_bridge(bridge)
      assert_raise Ecto.NoResultsError, fn -> Structure.get_bridge!(bridge.id) end
    end

    test "change_bridge/1 returns a bridge changeset" do
      bridge = bridge_fixture()
      assert %Ecto.Changeset{} = Structure.change_bridge(bridge)
    end
  end
end

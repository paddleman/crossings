defmodule Crossings.StructuresTest do
  use Crossings.DataCase

  alias Crossings.Structures

  describe "structures" do
    alias Crossings.Structures.Structure

    import Crossings.StructuresFixtures

    @invalid_attrs %{data_source: nil}

    test "list_structures/0 returns all structures" do
      structure = structure_fixture()
      assert Structures.list_structures() == [structure]
    end

    test "get_structure!/1 returns the structure with given id" do
      structure = structure_fixture()
      assert Structures.get_structure!(structure.id) == structure
    end

    test "create_structure/1 with valid data creates a structure" do
      valid_attrs = %{data_source: "some data_source"}

      assert {:ok, %Structure{} = structure} = Structures.create_structure(valid_attrs)
      assert structure.data_source == "some data_source"
    end

    test "create_structure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Structures.create_structure(@invalid_attrs)
    end

    test "update_structure/2 with valid data updates the structure" do
      structure = structure_fixture()
      update_attrs = %{data_source: "some updated data_source"}

      assert {:ok, %Structure{} = structure} = Structures.update_structure(structure, update_attrs)
      assert structure.data_source == "some updated data_source"
    end

    test "update_structure/2 with invalid data returns error changeset" do
      structure = structure_fixture()
      assert {:error, %Ecto.Changeset{}} = Structures.update_structure(structure, @invalid_attrs)
      assert structure == Structures.get_structure!(structure.id)
    end

    test "delete_structure/1 deletes the structure" do
      structure = structure_fixture()
      assert {:ok, %Structure{}} = Structures.delete_structure(structure)
      assert_raise Ecto.NoResultsError, fn -> Structures.get_structure!(structure.id) end
    end

    test "change_structure/1 returns a structure changeset" do
      structure = structure_fixture()
      assert %Ecto.Changeset{} = Structures.change_structure(structure)
    end
  end
end

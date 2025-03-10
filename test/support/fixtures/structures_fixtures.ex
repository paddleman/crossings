defmodule Crossings.StructuresFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crossings.Structures` context.
  """

  @doc """
  Generate a structure.
  """
  def structure_fixture(attrs \\ %{}) do
    {:ok, structure} =
      attrs
      |> Enum.into(%{
        data_source: "some data_source"
      })
      |> Crossings.Structures.create_structure()

    structure
  end
end

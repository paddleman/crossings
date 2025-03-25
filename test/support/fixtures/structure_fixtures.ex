defmodule Crossings.StructureFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crossings.Structure` context.
  """

  @doc """
  Generate a bridge.
  """
  def bridge_fixture(attrs \\ %{}) do
    {:ok, bridge} =
      attrs
      |> Enum.into(%{
        bci: 120.5,
        cover_depth: 42,
        data_source: "some data_source",
        diameter: 42,
        height: 42,
        last_inspected: ~D[2025-03-22],
        latitude: 120.5,
        length: 120.5,
        longitude: 120.5,
        service_area_code: 42,
        shape: "some shape",
        structure_name: "some structure_name",
        structure_number: "some structure_number",
        type: "some type",
        urgency: 42,
        width: 42,
        year_build: 42
      })
      |> Crossings.Structure.create_bridge()

    bridge
  end
end

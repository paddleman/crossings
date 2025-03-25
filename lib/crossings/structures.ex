defmodule Crossings.Structures do
  @moduledoc """
  The Structures context.
  """

  import Ecto.Query, warn: false
  alias Crossings.Repo

  alias Crossings.Structures.Structure

  @doc """
  Returns the list of structures.

  ## Examples

      iex> list_structures()
      [%Structure{}, ...]

  """
  def list_structures do
    Repo.all(Structure)
  end

  @doc """
  Gets a single structure.

  Raises `Ecto.NoResultsError` if the Structure does not exist.

  ## Examples

      iex> get_structure!(123)
      %Structure{}

      iex> get_structure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_structure!(id), do: Repo.get!(Structure, id)

  @doc """
  Creates a structure.

  ## Examples

      iex> create_structure(%{field: value})
      {:ok, %Structure{}}

      iex> create_structure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_structure(attrs \\ %{}) do
    %Structure{}
    |> Structure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a structure.

  ## Examples

      iex> update_structure(structure, %{field: new_value})
      {:ok, %Structure{}}

      iex> update_structure(structure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_structure(%Structure{} = structure, attrs) do
    structure
    |> Structure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a structure.

  ## Examples

      iex> delete_structure(structure)
      {:ok, %Structure{}}

      iex> delete_structure(structure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_structure(%Structure{} = structure) do
    Repo.delete(structure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking structure changes.

  ## Examples

      iex> change_structure(structure)
      %Ecto.Changeset{data: %Structure{}}

  """
  def change_structure(%Structure{} = structure, attrs \\ %{}) do
    Structure.changeset(structure, attrs)
  end

  @doc """
  Returns the list of bridges.

  ## Examples

      iex> list_bridges()
      [%Bridge{}, ...]

  """
  def list_bridges do
    Repo.all(Bridge)
  end

  @doc """
  Gets a single bridge.

  Raises `Ecto.NoResultsError` if the Bridge does not exist.

  ## Examples

      iex> get_bridge!(123)
      %Bridge{}

      iex> get_bridge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bridge!(id), do: Repo.get!(Bridge, id)

  @doc """
  Creates a bridge.

  ## Examples

      iex> create_bridge(%{field: value})
      {:ok, %Bridge{}}

      iex> create_bridge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bridge(attrs \\ %{}) do
    %Bridge{}
    |> Bridge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bridge.

  ## Examples

      iex> update_bridge(bridge, %{field: new_value})
      {:ok, %Bridge{}}

      iex> update_bridge(bridge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bridge(%Bridge{} = bridge, attrs) do
    bridge
    |> Bridge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bridge.

  ## Examples

      iex> delete_bridge(bridge)
      {:ok, %Bridge{}}

      iex> delete_bridge(bridge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bridge(%Bridge{} = bridge) do
    Repo.delete(bridge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bridge changes.

  ## Examples

      iex> change_bridge(bridge)
      %Ecto.Changeset{data: %Bridge{}}

  """
  def change_bridge(%Bridge{} = bridge, attrs \\ %{}) do
    Bridge.changeset(bridge, attrs)
  end
end

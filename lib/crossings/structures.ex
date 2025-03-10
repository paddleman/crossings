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
end

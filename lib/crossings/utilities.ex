defmodule Crossings.Utilities do
  def pretty_num(float, decs) do
    if float == nil do
      nil
    else
      :erlang.float_to_binary(float, decimals: decs)
    end
  end
end

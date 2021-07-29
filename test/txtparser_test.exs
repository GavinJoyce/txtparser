defmodule TxtparserTest do
  use ExUnit.Case
  doctest Txtparser

  def assert_parsed(input, expected) do
    {:ok, result, _, _, _, _} = Txtparser.parse(input)

    assert result == expected
  end

  test "is parses correctly" do
    assert_parsed("hi", ["hi"])
    assert_parsed("hi _there_", ["hi", "_there_"]) # NOTE: this currently fails
  end
end

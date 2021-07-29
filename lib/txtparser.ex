defmodule Txtparser do
  import NimbleParsec

  defcombinatorp :plain_string,
    utf8_string([], min: 1)
    |> lookahead_not(parsec(:wrapped_string))

  defcombinatorp :wrapped_string,
    string("_")
    |> parsec(:plain_string)
    |> string("_")

  defparsec(:parse,
    repeat(
      choice(
        [parsec(:wrapped_string), parsec(:plain_string)]
      )
    )
  )
end

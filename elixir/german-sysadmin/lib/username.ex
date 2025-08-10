defmodule Username do
  def sanitize([]), do: []

  def sanitize([hd_username | tl_username]) do
    sanitized =
      case hd_username do
        ?ä -> ~c'ae'
        ?ö -> ~c'oe'
        ?ü -> ~c'ue'
        ?ß -> ~c'ss'
        x when x >= ?a and x <= ?z -> [x]
        ?_ -> ~c'_'
        _ -> ~c''
      end

    sanitized ++ sanitize(tl_username)
  end
end

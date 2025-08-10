defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim_leading(name) |> String.at(0)
  end

  def initial(name) do
    (first_letter(name) |> String.upcase()) <> "."
  end

  def initials(full_name) do
    [firstname, lastname] = String.split(full_name, " ")
    initial(firstname) <> " " <> initial(lastname)
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end

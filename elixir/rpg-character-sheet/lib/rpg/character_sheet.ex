defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  defp ask(question) do
    answer = IO.gets(question)
    String.trim(answer)
  end

  def ask_name(), do: ask("What is your character's name?\n")
  def ask_class(), do: ask("What is your character's class?\n")

  def ask_level() do
    answer = ask("What is your character's level?\n")
    {lvl, _results} = Integer.parse(answer)
    lvl
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    character = %{:class => class, :level => level, :name => name}

    IO.inspect(character, label: "Your character")
  end
end

defmodule HighScore do
  @default_initial 0

  def new(), do: %{}

  def add_player(scores, name, score \\ @default_initial), do: Map.put(scores, name, score)

  def remove_player(scores, name) when is_map_key(scores, name) do
    Map.delete(scores, name)
  end

  def remove_player(scores, _name), do: scores

  def reset_score(scores, name) when is_map_key(scores, name) do
    Map.replace(scores, name, @default_initial)
  end

  def reset_score(scores, name), do: add_player(scores, name)

  def update_score(scores, name, score) when is_map_key(scores, name) do
    Map.replace(scores, name, Map.get(scores, name) + score)
  end

  def update_score(scores, name, score), do: add_player(scores, name, score)

  def get_players(scores), do: Map.keys(scores)
end

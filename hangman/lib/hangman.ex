defmodule Hangman do
  alias Hangman.Runtime.Server
  alias Hangman.Type

  @type state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used
  @opaque game :: Server.t()
  @type tally :: Type.tally()

  @type tally :: %{
          turns_left: integer,
          game_state: state,
          letters: list(String.t()),
          used: list(String.t())
        }

  @spec new_game :: game
  def new_game do
     {:ok, pid} = Hangman.Runtime.Application.start_game
     pid
  end

  @spec make_move(game, String.t()) :: tally
  def make_move(game, guess)do
     GenServer.call(game, {:make_move, guess})
  end

  @spec tally(game) :: tally
  def tally(game) do
    GenServer.call(game, {:tally})
  end
end

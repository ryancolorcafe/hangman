defmodule Dictionary.Runtime.Server do
  use Agent

  alias Dictionary.Impl.WordList

  @me __MODULE__

  @type t :: pid()
  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word() do
    if :rand.uniform < 0.33 do
      Agent.get(@me, fn _ -> exit(:boom) end)
    end
    Agent.get(@me, &WordList.random_word/1)
  end
end

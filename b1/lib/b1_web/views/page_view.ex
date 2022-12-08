defmodule B1Web.PageView do
  use B1Web, :view

  def plural_phrase(1, noun), do: "one #{noun}"
  def plural_phrase(n, noun), do: "#{n} #{noun}s"
end

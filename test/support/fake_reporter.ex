# We need this because :exometer_reporter.add_reporter crashes if
# it is called with an invalid module that does not implements
# exometer_report behaviour
defmodule FakeReporter do
  use Alchemetrics.CustomReporter
  def init(_), do: {:ok, []}
  def report(_,_,_,_), do: {:ok, []}
end

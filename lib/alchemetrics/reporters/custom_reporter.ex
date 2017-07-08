defmodule Alchemetrics.CustomReporter do
  @type t :: module
  @type opts :: Map.t

  @doc """
  This is called when the reporter is started. You can put some initialization code here, like connection stuff.

  The `opts` argument stores reporter specific configuration. You can set this parameter with `opts` option on `reporter_list` config.

  ```
  # The value of `opts` key is the argument of the init/1 function!
  config :alchemetrics, reporter_list: [
    [module: MyApp.DummyReporter, opts: [some_data: "hello!"]]
  ]
  ```
  """
  @callback init(opts) :: any

  @doc """
  This is called every time a metric datapoint is reported.

  For a metric which is reported every 10 seconds, this function will be called every 10 seconds for each one of its datapoints.
  """
  @callback report(String.t, Atom.t, any, opts) :: any

  defmacro __using__(_) do
    quote do
      @behaviour Alchemetrics.CustomReporter

      def exometer_init(options) do
        __MODULE__.init(options)
        {:ok, options}
      end

      def exometer_report(metric_name, data_point, _extra, value, options) do
        __MODULE__.report(metric_name, data_point, value, options)
        {:ok, options}
      end

      def exometer_subscribe(_, _, _, _, opts), do: {:ok, opts}
      def exometer_unsubscribe(_, _, _, opts), do: {:ok, opts}
      def exometer_call(_, _, opts), do: {:ok, opts}
      def exometer_cast(_, opts), do: {:ok, opts}
      def exometer_info(_, opts), do: {:ok, opts}
      def exometer_newentry(_, opts), do: {:ok, opts}
      def exometer_setopts(_, _, _, opts), do: {:ok, opts}
      def exometer_terminate(_, _), do: nil
    end
  end
end
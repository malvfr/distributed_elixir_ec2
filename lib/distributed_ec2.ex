defmodule DistributedEc2 do
  use Application

  def start(_type, _args) do
    topologies = [
      ec2: [
        strategy: ClusterEC2.Strategy.Tags,
        config: [
          ec2_tagname: "elxtag",
          ec2_tagvalue: "distelixir",
          app_prefix: "distributed_ec2",
          ip_to_nodename: &ip_to_nodename/2
        ]
      ]
    ]

    children = [
      {Cluster.Supervisor, [topologies, [name: DistributedEc2.ClusterSupervisor]]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: DistributedEc2.Supervisor)
  end

  defp ip_to_nodename(list, app_prefix) when is_list(list) do
    list
    |> Enum.map(fn ip ->
      ip_with_dash = String.replace(ip, ".", "-")
      :"#{app_prefix}@ip-#{ip_with_dash}"
    end)
  end
end

defmodule DistributedEc2 do
  use Application

  def start(_type, _args) do
    # if Mix.env() == :dev do
    #   [
    #     gossip: [
    #       strategy: Cluster.Strategy.Gossip,
    #       config: [
    #         port: 45892,
    #         if_addr: "0.0.0.0",
    #         multicast_if: "192.168.1.1",
    #         multicast_addr: "233.252.1.32",
    #         multicast_ttl: 1,
    #         secret: "123"
    #       ]
    #     ]
    #   ]
    # else
    topologies = [
      ec2: [
        strategy: ClusterEC2.Strategy.Tags,
        config: [
          ec2_tagname: "elxtag",
          ec2_tagvalue: "distelixir"
        ]
      ]
    ]

    # end

    children = [
      {Cluster.Supervisor, [topologies, [name: DistributedEc2.ClusterSupervisor]]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: DistributedEc2.Supervisor)
  end
end

## Connected Components
#
# You are given a file which looks like so:
#
# ```
# AA BB
# DD FF
# CC EE
# EE DD
# ```
#
# Each line of the file contains a pair of strings. Each string
# represents is the name of a **vertex**. The line represents an
# **edge** connecting two vertices.
#
# Your task is to find the **connected components** of the graph. A
# connected component is a subset of vertices all connected to each
# other. In this example, the connected components are `[["AA", "BB"],
# ["CC", "DD", "EE", "FF"]]`.
#
# You don't have to return the elements of the components in any
# particular order.


# This actually doesn't work with the given example
def connected_components(path_name)
  stream = File.open(path_name, "r")

  connections = Hash.new()

  stream.each_line do |line|
    vertices = line.split(" ")

    connected = false
    connection = nil
    merge = false
    merge_vertices = []

    vertices.each do |vertex|
      if (connections[vertex])
        if (connected == false)
          connected == true
          connection = vertex
        else
          merge = true
          merge_vertices.push(vertex)
        end
      end
    end

    if (connected == false)
      connections[vertices[0]] = []

      vertices.each_with_index do |vertex, i|
        next if i == 0

        connections[vertices[0]].push(vertex)
      end
    elsif (merge == true)
      #TODO
    else
      vertices.each do |vertex|
        next if vertex == connection

        connections[connection].push(vertex)
      end
    end
  end

  stream.close

  return connections
end

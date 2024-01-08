#!/bin/bash

graphml_file='citation_graph.graphml'

script_python_q1=$(cat <<-END
import networkx as nx

# Read the Graph from the GraphML file
citation_graph = nx.read_graphml('$graphml_file')

# 1. Is there any node that acts as an important "connector" between the different parts of the graph?

# Degree Centrality
degree_centrality = nx.degree_centrality(citation_graph)
high_centrality_node = max(degree_centrality, key=degree_centrality.get)
print(f"Node: {high_centrality_node}, with degree centrality: {degree_centrality[high_centrality_node]}")
END
)

python3 -c "$script_python_q1"


script_python_q2=$(cat <<-END
import networkx as nx
import pandas as pd

# Read the Graph from the GraphML file
citation_graph = nx.read_graphml('$graphml_file')

# 2. How does the degree of citation vary among the graph nodes?

# Calculate total degree for each node
node_degrees = dict(citation_graph.degree())
sorted_nodes = sorted(node_degrees.items(), key=lambda x: x[1], reverse=True)

# Display top three nodes with highest total degree values
print("Top three nodes with highest total degree values:")
print("1. {}".format(sorted_nodes[0]))
print("2. {}".format(sorted_nodes[1]))
print("3. {}".format(sorted_nodes[2]))

# Display highest in-degree and out-degree nodes
in_degrees = dict(citation_graph.in_degree())
out_degrees = dict(citation_graph.out_degree())

highest_in_degree_node = max(in_degrees, key=in_degrees.get)
highest_out_degree_node = max(out_degrees, key=out_degrees.get)

print("Highest in-degree node: {}".format(highest_in_degree_node))
print("Highest out-degree node: {}".format(highest_out_degree_node))

# Calculate and display degree statistics
node_degrees_series = pd.Series(list(node_degrees.values()))
in_degrees_series = pd.Series(list(in_degrees.values()))
out_degrees_series = pd.Series(list(out_degrees.values()))

for series, name in zip([node_degrees_series, in_degrees_series, out_degrees_series], ['Total', 'In', 'Out']):
   mean = series.mean()
   median = series.median()
   minimum = series.min()
   maximum = series.max()
   first_quartile = series.quantile(0.25)
   third_quartile = series.quantile(0.75)

   print("\n{} degrees statistics:".format(name))
   print("Mean: {}".format(mean))
   print("Median: {}".format(median))
   print("Min: {}".format(minimum))
   print("Max: {}".format(maximum))
   print("1st Quartile: {}".format(first_quartile))
   print("3rd Quartile: {}".format(third_quartile))
END
)

python3 -c "$script_python_q2"


script_python_q3=$(cat <<-END
import networkx as nx
import pandas as pd

# Read the Graph from the GraphML file
citation_graph = nx.read_graphml('$graphml_file')

# Remove isolated nodes
isolated_nodes = list(nx.isolates(citation_graph))
print("Number of isolated nodes deleted: ", len(isolated_nodes))
citation_graph.remove_nodes_from(isolated_nodes)

# Calculate strongly connected components
num_components = nx.number_strongly_connected_components(citation_graph)
print("Number of strongly connected components: ", num_components)

# Analyze strongly connected components
components = sorted(nx.strongly_connected_components(citation_graph), key=len, reverse=True)

# Display information about the largest components
largest_component = components[0]
print("Nodes in largest strongly connected component: ", len(largest_component))
print("Average degree in largest strongly connected component: ", sum(citation_graph.degree(node) for node in largest_component) / len(largest_component))
print("Maximum degree in largest strongly connected component: ", max(citation_graph.degree(node) for node in largest_component))

# Display information about the second largest component
second_largest_component = components[1]
print("\nNodes in second largest strongly connected component: ", len(second_largest_component))
print("Average degree in second largest strongly connected component: ", sum(citation_graph.degree(node) for node in second_largest_component) / len(second_largest_component))
print("Maximum degree in second largest strongly connected component: ", max(citation_graph.degree(node) for node in second_largest_component))

# Display information about the third largest component
third_largest_component = components[2]
print("\nNodes in third largest strongly connected component: ", len(third_largest_component))
print("Average degree in third largest strongly connected component: ", sum(citation_graph.degree(node) for node in third_largest_component) / len(third_largest_component))
print("Maximum degree in third largest strongly connected component: ", max(citation_graph.degree(node) for node in third_largest_component))

# Define function to calculate average shortest path for components with a path
def calculate_component_avg_shortest_path(component, graph):
    if len(component) > 1:
        subgraph = graph.subgraph(component)
        return nx.average_shortest_path_length(subgraph)
    else:
        return 0

# Calculate average shortest path for strongly connected components with paths
SCCs = list(nx.strongly_connected_components(citation_graph))
SCC_avg_path_lengths = []

for component in SCCs:
    avg_path_length = calculate_component_avg_shortest_path(component, citation_graph)
    if avg_path_length > 0:
        SCC_avg_path_lengths.append(avg_path_length)

# Remove components with 0 average path length
SCC_avg_path_lengths = [length for length in SCC_avg_path_lengths]

print(f"Number of SCCs with paths: {len(SCC_avg_path_lengths)}")


if [ "${#SCC_avg_path_lengths[*]}" -gt 0 ]; then
    avg_shortest_path_length=$(python3 -c "print(sum($SCC_avg_path_lengths) / len($SCC_avg_path_lengths))")
    min_shortest_path_length=$(python3 -c "print(min($SCC_avg_path_lengths))")
    max_shortest_path_length=$(python3 -c "print(max($SCC_avg_path_lengths))")
    first_quartile=$(python3 -c "import pandas as pd; print(pd.Series($SCC_avg_path_lengths).quantile(0.25))")
    third_quartile=$(python3 -c "import pandas as pd; print(pd.Series($SCC_avg_path_lengths).quantile(0.75))")
else
    avg_shortest_path_length=0
    min_shortest_path_length=0
    max_shortest_path_length=0
    first_quartile=0
    third_quartile=0
fi

echo -e "\nAverage shortest path length among SCCs with paths: $avg_shortest_path_length"
echo "Minimum shortest path length: $min_shortest_path_length"
echo "Maximum shortest path length: $max_shortest_path_length"
echo "1st Quartile: $first_quartile"
echo "3rd Quartile: $third_quartile"



END
)

python3 -c "$script_python_q3"

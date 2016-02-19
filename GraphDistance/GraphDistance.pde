/*

GRAPH DISTANCES
return shortest distance between two nodes

There are two options:

      .getPhysicalDistance() weighted (consider connection lengths)
      .getNodeDistance() node (minimal # of nodes)

REFERENCES:
[for the undirected graphs]
https://en.wikipedia.org/wiki/Shortest_path_problem
https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm  Dijkstra, 1959
https://en.wikipedia.org/wiki/Fibonacci_heap Fredman & Tarjan, 1984 [Dijkstra's with Fibonacci heap]
http://dl.acm.org/citation.cfm?id=316548 Thorup, 1999

@author    Vladimir V. KUCHINOV
@email     helloworld@vkuchinov.co.uk

*/

final String URL = "data/TriakisTetrahedralGraph.svg";
Graph g;

void setup(){
 
     size(750, 750, "processing.core.PGraphicsRetina2D"); 
     g = new Graph(URL);
  
}

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.util.Collections;
import java.util.Comparator;
import java.util.Arrays;
import java.util.List;

class Graph{
  
       final float PRECISION = 3.0;
       
       ArrayList<Node> nodes; 
       PVector[] connections;
       
       Graph(String url_){
        
           //nodes have x,y values
           XML xml = loadXML(URL);
           XML[] xmlPoints = xml.getChildren("ellipse");
           
           nodes = new ArrayList<Node>();
  
           for (int p = 0; p < xmlPoints.length; p++) {
             
                nodes.add(new Node(p, Float.parseFloat(xmlPoints[p].getString("cx")), Float.parseFloat(xmlPoints[p].getString("cy")))); 
             
           }
           
           //sorting nodes
           Collections.sort(nodes, compose(new sortByX(), new sortByY()));
           println(nodes.size());
           //connections node1, node2
           XML[] xmlLines = xml.getChildren("line");
    
           connections = new PVector[xmlLines.length];
           
           for (int p = 0; p < xmlLines.length; p++) {
           
                int[] pairing = getNodes(xmlLines[p]);
                if(pairing[0] != Integer.MIN_VALUE && pairing[1] != Integer.MIN_VALUE){
                connections[p] = new PVector(pairing[0], pairing[1]); }
                else{
                println("broken connection");
                }
  
           }
        
       } 
       
       int[] getNodes(XML string_){
         
            int[] output = { Integer.MIN_VALUE, Integer.MIN_VALUE };
            
            PVector p0 = new PVector(Float.parseFloat(string_.getString("x1")), Float.parseFloat(string_.getString("y1")));
            PVector p1 = new PVector(Float.parseFloat(string_.getString("x2")), Float.parseFloat(string_.getString("y2")));
         
            for(int n = 0; n < nodes.size(); n++){
              
                  if(PVector.dist(p0, nodes.get(n)) < PRECISION) output[0] = n;
                  if(PVector.dist(p1, nodes.get(n)) < PRECISION) output[1] = n;
              
            }
            return output; 
       }
       
       void getPhysicalDistance(Node n1_, Node n2_){
         
       }
       
       void getNodeDistance(Node n1_, Node n2_){
         
       }
       
       void getPhysicalDistance(int n1_, int n2_){
         
       }
       
       void getNodeDistance(int n1_, int n2_){
         
           //building path list where
           //no return, no repitions
           //if where is a crossroad (>= 2 ways) clone to children
           //if path reaches destination > stop growing
           //if path gets all nodes > stop growing
           //if last node doesn't have any ways except parent > stop gwowing
          
           PathList paths = new PathList();
           //paths.addAll((List)Arrays.asList(getNextNodes()))
         
       }
       
       void Dijkstras(){
         
         
         
       }
       
       void draw(){

             for(int c = 0; c < connections.length; c++){
               
                 strokeWeight(1.0);
                 stroke(0);
                 line(nodes.get((int)connections[c].x).x, nodes.get((int)connections[c].x).y, nodes.get((int)connections[c].y).x, nodes.get((int)connections[c].y).y);
               
             }
             
             for(int n = 0; n < nodes.size(); n++){
               
                 strokeWeight(8.0);
                 stroke(255, 0, 255);
                 point(nodes.get(n).x, nodes.get(n).y);
   
             }

         
       }
       
       void selectNode(int n_){

                 strokeWeight(10.0);
                 stroke(0, 255, 255);
                 point(nodes.get(n_).x, nodes.get(n_).y);

       }
  
}

class NodeList extends ArrayList{
  
  void print(){
    
    if(this.size() != 0){
      
        for(int n = 0; n < this.size(); n++){
          
          println(this.get(n));
          
        }
    }
  }
}

class Node extends PVector{
  
   int index;
   String name;
  
   Node(int i_, float x_, float y_){
     
     index = i_;
     x = x_; y = y_;
     
   }
    
   Node(int i_, String name_, float x_, float y_){
     
     index = i_;
     x = x_; y = y_;
     name = name_;
     
   }
   
   Node(int i_, float x_, float y_, float z_){
    
     index = i_;
     x = x_; y = y_; z = z_;
    
   } 
   
   void print(){
     
      println("index:", index, "x:", x, "y:", y, "z:", z);
     
   }
   
   int getIndex() { return this.index; }
   float getX()  { return this.x; }
   float getY()  { return this.y; }
   float getZ()  { return this.z; }

  //COMPARATOR SET
//examples: Collections.sort(ListName, new sortByX());

class sortByIndex implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Integer.valueOf(n1.getIndex()).compareTo(n2.getIndex());
        
}}

class sortByX implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getX(), n2.getX());
        
}}

class sortByY implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getY(), n2.getY());
        
}}

class sortByZ implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getZ(), n2.getZ());
        
}}

//SUPER CLASS FOR TWO PARAMETERS SORT
//examples Collections.sort(ListName, compose(new sortByX(), new sortByY())); 

public <T> Comparator<T> compose(
    final Comparator<? super T> primary,
    final Comparator<? super T> secondary
    
) {
    return new Comparator<T>() {
        public int compare(T a, T b) {
            int result = primary.compare(a, b);
            return result==0 ? secondary.compare(a, b) : result;
        }
    };
}


}

//COMPARATOR SET
//examples: Collections.sort(ListName, new sortByX());

class sortByIndex implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Integer.valueOf(n1.getIndex()).compareTo(n2.getIndex());
        
}}

class sortByX implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getX(), n2.getX());
        
}}

class sortByY implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getY(), n2.getY());
        
}}

class sortByZ implements Comparator<Node> { 

        @Override
        public int compare(Node n1, Node n2) {
        return Float.compare(n1.getZ(), n2.getZ());
        
}}

//SUPER CLASS FOR TWO PARAMETERS SORT
//examples Collections.sort(ListName, compose(new sortByX(), new sortByY())); 

public <T> Comparator<T> compose(
    final Comparator<? super T> primary,
    final Comparator<? super T> secondary
    
) {
    return new Comparator<T>() {
        public int compare(T a, T b) {
            int result = primary.compare(a, b);
            return result==0 ? secondary.compare(a, b) : result;
        }
    };
}

class Path{
 
    int steps;
    float distance;
    
    Path(){
     
    } 
  
}

class PathList extends ArrayList<Path>{
  
   

  
}

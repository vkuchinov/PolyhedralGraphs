/*

GRAPH PARSER
frommodified SVG

@author  Vladimir V. KUCHINOV
@email   helloworld@vkuchinov.co.uk

*/

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


final String URL = "ZamfirescuGraph.svg";

pointList points = new pointList();

void setup(){
  
     size(800, 800,"processing.core.PGraphicsRetina2D"); 
     
     XML xml = loadXML(URL);
     XML[] xmlPoints = xml.getChildren("circle");
     
    for (int p = 0; p < xmlPoints.length; p++) {
    
          points.add(new PVector(Float.parseFloat(xmlPoints[p].getString("cx")), Float.parseFloat(xmlPoints[p].getString("cy"))));
    
    }

    XML[] xmlLines = xml.getChildren("line");
    
    for (int p = 0; p < xmlLines.length; p++) {
    
          PVector p0 = new PVector(Float.parseFloat(xmlLines[p].getString("x1")), Float.parseFloat(xmlLines[p].getString("y1")));
          PVector p1 = new PVector(Float.parseFloat(xmlLines[p].getString("x2")), Float.parseFloat(xmlLines[p].getString("y2")));
    
    }
    
    
    
    strokeWeight(2);
    points.draw();
    
  
}


class pointList extends ArrayList<PVector>{
  
      void draw(){
         
           for(int p = 0; p < this.size(); p++){
                point(this.get(p).x, this.get(p).y);
           } 
        
      }
      
      float[] getBounds(){
        
          float minX = Float.MAX_VALUE, maxX = Float.MIN_VALUE;
          float minY = Float.MAX_VALUE, maxY = Float.MIN_VALUE;
          
          for(int p = 0; p < this.size(); p++){
                
                minX = min(minX, this.get(p).x);
                maxX = max(maxX, this.get(p).x);
                minY = min(minY, this.get(p).y);
                maxY = max(maxY, this.get(p).y);
                
           } 
           
          return new float[]{minX, maxX, minY, maxY};
          
      }
  
}

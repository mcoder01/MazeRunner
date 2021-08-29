import java.util.LinkedList;

class AStar {
  private Spot[][] grid;
  private LinkedList<Spot> openSet;
  private Spot current, end;
  private boolean done;
  
  public AStar(Spot[][] grid) {
    this.grid = grid;
    
    openSet = new LinkedList<Spot>();
    Spot start = grid[0][0];
    end = grid[rows-1][cols-1];
    openSet.add(start);
  }
  
  public void findPath() {
    if (!done)
      if (openSet.size() > 0) {
        current = openSet.getFirst();
        for (Spot s : openSet)
          if (s.getF() < current.getF())
            current = s;
          
        openSet.remove(current);
        current.setViewed(true);
      
        if (current == end) {
          println("Path found!");
          done = true;
          return;
        }
        
        ArrayList<Spot> neighbors = current.openWays(grid);
        for (Spot s : neighbors)
          if (!s.isViewed()) {
            float tempG = current.getG()+1;
            boolean newPath = false;
        
            if (openSet.contains(s)) {
              if (tempG < s.getG()) {
                s.setG(tempG);
                newPath = true;
              }
            } else {
              s.setG(tempG);
              openSet.add(s);
              newPath = true;
            }
        
            if (newPath) {
              s.calculateF(end);
              s.setPrevious(current);
            }
          }
      } else {
        println("Can't reach the end!");
        done = true;
      }
  }
  
  public void show(color c) {
    Spot s = current;
    while(s != null) {
      s.showPath(c);
      s = s.getPrevious();
    }
  }
}
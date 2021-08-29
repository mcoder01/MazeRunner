class Spot extends Cell {
  private float g, f;
  
  private Spot previous;
  
  public Spot(int i, int j, float w, float h) {
    super(i, j, w, h);
  }
  
  public void showPath(color c) {
    if (previous != null) {
      stroke(c);
      strokeWeight(w/3);
      line(col*w+w/2, row*h+h/2, previous.col*w+w/2, previous.row*h+h/2);
    }
  }
  
  public ArrayList<Spot> openWays(Spot[][] maze) {
    ArrayList<Cell> neighbors = super.neighbors(maze);
    ArrayList<Spot> openWays = new ArrayList<Spot>();
    for (Cell c : neighbors) {
      int x = c.col-col;
      int y = c.row-row;
      if ((x == 1 && !c.hasLeft())
          || (x == -1 && !left)
          || (y == 1 && !c.hasTop())
          || (y == -1 && !top))
        openWays.add((Spot) c);
    }
    
    return openWays;
  }
  
  private float heuristic(Spot s) {
    return dist(col, row, s.col, s.row);
  }
  
  public void calculateF(Spot end) {
    f = g + heuristic(end);
  }
  
  public float getG() {
    return g;
  }
  
  public void setG(float g) {
    this.g = g;
  }
  
  public float getF() {
    return f;
  }
  
  public Spot getPrevious() {
    return previous;
  }
  
  public void setPrevious(Spot previous) {
    this.previous = previous;
  }
}
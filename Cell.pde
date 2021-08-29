class Cell {
  protected int row, col;
  protected float w, h;
  
  protected boolean top, left;
  protected boolean viewed;
  
  public Cell(int row, int col, float w, float h) {
    this.row = row;
    this.col = col;
    this.w = w;
    this.h = h;
    
    top = true;
    left = true;
  }
  
  public ArrayList<Cell> neighbors(Cell[][] maze) {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();
    if (row > 0 && !maze[row-1][col].isViewed())
        neighbors.add(maze[row-1][col]);
    if (col < cols-1 && !maze[row][col+1].isViewed())
        neighbors.add(maze[row][col+1]);
    if (row < rows-1 && !maze[row+1][col].isViewed())
        neighbors.add(maze[row+1][col]);
    if (col > 0 && !maze[row][col-1].isViewed())
        neighbors.add(maze[row][col-1]);
    
    return neighbors;
  }
  
  public void show() {
    noFill();
    stroke(255);
    strokeWeight(3);
    if (top)
      line(col*w, row*h, (col+1)*w, row*h);
    if (left)
      line(col*w, row*h, col*w, (row+1)*h);
  }
  
  public void show(color c) {
    noStroke();
    fill(c);
    rect(col*w, row*h, w, h);
  }
  
  public int getRow() {
    return row;
  }
  
  public int getCol() {
    return col;
  }
  
  public boolean hasTop() {
    return top;
  }
  
  public void setTop(boolean top) {
    this.top = top;
  }
  
  public boolean hasLeft() {
    return left;
  }
  
  public void setLeft(boolean left) {
    this.left = left;
  }
  
  public boolean isViewed() {
    return viewed;
  }
  
  public void setViewed(boolean viewed) {
    this.viewed = viewed;
  }
}
import java.util.LinkedList;

class MazeGenerator {
  private Cell[][] maze;
  
  private Cell current;
  private LinkedList<Cell> history;
  private boolean generated;
  
  public MazeGenerator(Cell[][] maze) {
    this.maze = maze;
    current = maze[0][0];
    history = new LinkedList<Cell>();
  }
  
  public void generate() {
    current.setViewed(true);
    ArrayList<Cell> neighbors = current.neighbors(maze);
    for (int i = 0; i < neighbors.size(); i++)
      if (neighbors.get(i).isViewed())
        neighbors.remove(i);
    
    if (neighbors.size() > 0) {
      int r = (int) random(neighbors.size());
      Cell next = neighbors.get(r);
      removeWalls(current, next);
      history.add(current);
      current = next;
    } else if (!history.isEmpty())
      current = history.removeLast();
    else {
      finish();
      generated = true;
    }
  }
  
  public void show() {
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        if (maze[i][j].isViewed())
          maze[i][j].show(color(150, 0, 255, 100));
        
    current.show(color(0, 255, 0));
  }
  
  private void removeWalls(Cell a, Cell b) {
    int x = a.getCol()-b.getCol();
    int y = a.getRow()-b.getRow();
    if (x == 1) a.setLeft(false);
    else if (x == -1) b.setLeft(false);
    else if (y == 1) a.setTop(false);
    else if (y == -1) b.setTop(false);
  }
  
  private void finish() {
    for (Cell[] row : maze)
      for (Cell c : row)
         c.setViewed(false);
  }
  
  public Cell getCurrent() {
    return current;
  }
  
  public boolean isGenerated() {
    return generated;
  }
}
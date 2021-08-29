final int rows = 25, cols = 25; //Edit these values to change the grid size
float w, h;

Spot[][] maze;
MazeGenerator mg;
AStar pathFinder;

void setup() {
  size(1080, 1080); //Set here the window resolution
  frameRate(15); //Edit this value to change the game speed
  w = width/cols;
  h = height/rows;
  
  maze = new Spot[rows][cols];
  for (int i = 0; i < rows; i++)
    for (int j = 0; j < cols; j++)
      maze[i][j] = new Spot(i, j, w, h);
      
  mg = new MazeGenerator(maze);
  pathFinder = new AStar(maze);
}

void draw() {
  background(0);
 
  for (int i = 0; i < rows; i++)
    for (int j = 0; j < cols; j++)
      maze[i][j].show();
      
  if (!mg.isGenerated()) {
    mg.generate();
    mg.show();
  } else {
    pathFinder.findPath();
    pathFinder.show(color(0, 0, 255));
  }
}
int[] emptyIndices() {
  int board[] = {
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0};
  int i = 0;
  for (int x = 0; x < map.length; x++) {
    for (int y = 0; y < map[0].length; y++) {
      board[i] = map[x][y];
      i++;
    }
  }
  int c = 0;
  for (int j = 0; j < 9; j++) {
    if (board[j] == 0) {
      c++;
    }
  }
  int l = 0;
  int[] ind = new int[c];
  for (int k = 0; k < 9; k++) {
    if (board[k] == 0) {
      ind[l] = k;
      l++;
    }
  }
  return ind;
}

void mouseReleased() {
  if (map[select_map[0]][select_map[1]] == 0) {
    if (is1P) {
      map[select_map[0]][select_map[1]] = 1;
    } else {
      map[select_map[0]][select_map[1]] = 2;
    }
    is1P = !is1P;
  }
  if (game_over) {
    game_end = millis() - 1750;
  }
}

boolean winning(int player) {
  int board[] = {
    0, 0, 0, 
    0, 0, 0, 
    0, 0, 0};
  int i = 0;
  for (int x = 0; x < map.length; x++) {
    for (int y = 0; y < map[0].length; y++) {
      board[i] = map[x][y];
      i++;
    }
  }
  if (
    (board[0] == player && board[1] == player && board[2] == player) ||
    (board[3] == player && board[4] == player && board[5] == player) ||
    (board[6] == player && board[7] == player && board[8] == player) ||
    (board[0] == player && board[3] == player && board[6] == player) ||
    (board[1] == player && board[4] == player && board[7] == player) ||
    (board[2] == player && board[5] == player && board[8] == player) ||
    (board[0] == player && board[4] == player && board[8] == player) ||
    (board[2] == player && board[4] == player && board[6] == player)
    ) {
    return true;
  } else {
    return false;
  }
}

int good() {
  return 1;
}

void draw_map(int x, int y, int map_size) {
  push();
  translate(x, y);
  int step = map_size/3;
  strokeWeight(1);
  stroke(white);
  noFill();
  rect(0, 0, map_size, map_size);
  strokeWeight(10);
  //vertical
  line(step, 0, step, step*3);
  line(step*2, 0, step*2, step*3);
  //horisontal
  line(0, step, step*3, step);
  line(0, step*2, step*3, step*2);
  pop();
}

void draw_x(int mx, int my, int x, int y, int map_size, boolean selecting) {
  push();
  int step = map_size/3;
  translate(mx + map_size/3, my + map_size/3);
  translate(x - step, y - step);
  strokeWeight(12.5);
  if (selecting) {
    stroke(s_red, 200);
  } else {
    stroke(red);
  }
  line(25, 25, step-25, step-25);
  line(25, step-25, step-25, 25);
  pop();
}

void draw_o(int mx, int my, int x, int y, int map_size, boolean selecting) {
  push();
  int step = map_size/3;
  translate(mx + map_size/3, my + map_size/3);
  translate(x - map_size/6, y - map_size/6);
  noFill();
  strokeWeight(12.5);
  if (selecting) {
    stroke(s_blue, 200);
  } else {
    stroke(blue);
  }
  ellipse(0, 0, step - 25, step - 25);
  pop();
}

int testWiner() {
  int res = 0;
  for (int i = 0; i < 3; i++) {
    if (map[0][i] == map[1][i] && map[1][i] == map[2][i]) {
      res = map[0][i];
    } else if (map[i][0] == map[i][1] && map[i][1] == map[i][2]) {
      res = map[i][0];
    }
  }
  if (map[0][0] == map[1][1] && map[1][1] == map[2][2]) {
    res = map[1][1];
  }
  if (map[2][0] == map[1][1] && map[1][1] == map[0][2]) {
    res = map[1][1];
  }
  int empty = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (map[i][j] == 0) {
        empty++;
      }
    }
  }
  if (empty == 0) {
    res = 3;
  }
  return res;
}

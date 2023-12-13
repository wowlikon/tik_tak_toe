
boolean is1P = true;
boolean game_over = false;
int game = 1;
int winer = 0;
int score_1p = 0;
int score_2p = 0;
int mapS = 500;
int game_end = 0;
color s_red = color(161, 21, 0);
color s_blue = color(0, 82, 163);
color red = color(255, 33, 0);
color blue = color(0, 128, 255);
color white = color(250, 250, 250);
int map[][] = new int[3][3];
int[] select = new int[2];
int[] select_map = new int[2];
int ai_best_score = -100000;

void setup() {
  size(750, 750);
  textAlign(CENTER);
  textFont(loadFont("now.vlw"));
  textSize(48);
  ellipseMode(CENTER);
}

void draw() {
  //printArray(emptyIndices());
  background(20);
  stroke(red);
  fill(red);
  text(score_1p, width/2-25, 50);
  stroke(white);
  fill(white);
  text(":", width/2, 50);
  stroke(blue);
  fill(blue);
  text(score_2p, width/2+25, 50);
  winer = testWiner();
  if (winer == 0 && !game_over) {
    //println(winning(1));
    draw_map(width/2 - mapS/2, width/2 - mapS/2, mapS);
    fill(255);
    if (mouseX > width/2 - mapS/2 && mouseY > width/2 - mapS/2 && mouseX < width/2 + mapS/2 && mouseY < width/2 + mapS/2) {
      select[0] = mouseX - width/2 + mapS/2;
      select[1] = mouseY - height/2 + mapS/2;
      select[0] = constrain(round(select[0]/(mapS/3))*mapS/3, 0, 333);
      select[1] = constrain(round(select[1]/(mapS/3))*mapS/3, 0, 333);
    }
    select_map[0] = constrain(select[0]/150, 0, 2);
    select_map[1] = constrain(select[1]/150, 0, 2);
    for (int x = 0; x < map.length; x++) {
      for (int y = 0; y < map[0].length; y++) {
        if (map[x][y] == 1) {
          draw_x(width/2 - mapS/2, height/2 - mapS/2, x*(mapS/3), y*(mapS/3), mapS, false);
        } else if (map[x][y] == 2) {
          draw_o(width/2 - mapS/2, height/2 - mapS/2, x*(mapS/3), y*(mapS/3), mapS, false);
        }
      }
    }
    if (is1P) {
      draw_x(width/2 - mapS/2, height/2 - mapS/2, select[0], select[1], mapS, true);
    } else {
      draw_o(width/2 - mapS/2, height/2 - mapS/2, select[0], select[1], mapS, true);
    }
  } else {
    background(20);
    draw_map(width/2 - mapS/2, width/2 - mapS/2, mapS);
    for (int x = 0; x < map.length; x++) {
      for (int y = 0; y < map[0].length; y++) {
        if (map[x][y] == 1) {
          draw_x(width/2 - mapS/2, height/2 - mapS/2, x*(mapS/3), y*(mapS/3), mapS, false);
        } else if (map[x][y] == 2) {
          draw_o(width/2 - mapS/2, height/2 - mapS/2, x*(mapS/3), y*(mapS/3), mapS, false);
        }
      }
    }
    if (winer == 1 && !game_over) {
      score_1p++;
    } else if (winer == 2 && !game_over) {
      score_2p++;
    }
    stroke(red);
    fill(red);
    text(score_1p, width/2-25, 50);
    stroke(white);
    fill(white);
    text(":", width/2, 50);
    stroke(blue);
    fill(blue);
    text(score_2p, width/2+25, 50);
    if (winer == 1 && !game_over) {
      saveFrame("games/game" + game + ".png");
      game_over = true;
      winer = 0;
      game++;
      game_end = millis();
    } else if (winer == 2 && !game_over) {
      saveFrame("games/game" + game + ".png");
      game_over = true;
      winer = 0;
      game++;
      game_end = millis();
    } else if (winer == 3 && !game_over) {
      saveFrame("games/game" + game + ".png");
      game_over = true;
      winer = 0;
      game++;
      game_end = millis();
    }
    if (game_end + 2000 < millis()) {
      game_over = false;
      for (int x = 0; x < map.length; x++) {
        for (int y = 0; y < map[0].length; y++) {
          map[x][y] = 0;
        }
      }
    }
  }
}

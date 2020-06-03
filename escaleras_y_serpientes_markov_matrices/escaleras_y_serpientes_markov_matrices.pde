Matrix mt, ei;

boolean isPressed = false;

int turno = 0;
int row = 10;
int dado = 6;
int inicio = 1;

int N = (int)pow(     row      ,2);
float sizeSq;

void setup () {
  size(1050, 1050);
  //fullScreen();
  sizeSq = width/row ; 

  float [][] mtTemp = new float[N][N];
  for ( int i = 0; i < mtTemp.length; i++) {
    for ( int j = 0; j < mtTemp.length; j++) {
      mtTemp[i][j] = 0.0;
    }
    for ( int j = 0; j < dado; j++ ) {
      mtTemp[i][nNo(i+j+1, i)] += 1.0/dado;
    }
  }
  mt = new Matrix(mtTemp);



  float[][] eiTemp = new float[1][N];
  for ( int i = 0; i < N; i++) {
    eiTemp[0][i] = 0.0;
    //eiTemp[0][i] = 1.0/N;
  }
  eiTemp[0][inicio-1] = 1.0;
  ei = new Matrix( eiTemp );
  
}

void draw () {
  background(0);
  
  
  Matrix p = ei.copy();
  for (int i = 0; i < turno; i++) {
    p = p.mult(mt);
  }
  
  textSize( height*(60.0/300) / row );
  
  for ( int i = 0; i < N; i++ ) {
    float x = getX(i) * sizeSq, y = getY(i) * sizeSq;
    
    int M,m, d = 0;
    if ( i % (row * 2) < row ) {
      M = 255;
      m = 150;
    } else {
      M = 255 - d;
      m = 150 - d;
    }
    
    //fill( map(p.getElement(0,i),0, 1,150,255) );
    fill( map(p.getElement(0,i),0,max(p.e[0]), m, M) );
    
    rect( x, y, sizeSq-1, sizeSq-1 );
    
    fill(0);
    text( (p.getElement(0,i) * 100), x + 180/row, y + 180/row);
    text(                 i+1      , x + 300/row, y + 900/row);
    
  }
  
  for ( int i = 0; i < N; i++) {
    if ( p.getElement(0,i) == 0 ) {
      if ( nNo(i) != i ) {
        strokeWeight(10);
        if ( nNo(i) > i ) {
          stroke(0,255,0,100);
        } else {
          stroke(255,0,0,100);
        }
        int x1 =        getX(i) * (int)sizeSq + int(sizeSq / 2),      y1 =        getY(i) * (int)sizeSq + int(sizeSq / 2);
        int x2 = getX( nNo(i) ) * (int)sizeSq + int(sizeSq / 2),      y2 = getY( nNo(i) ) * (int)sizeSq + int(sizeSq / 2);
        
        line(x1, y1, x2, y2);
        
        stroke(0);
        strokeWeight(0);
      }
    }
  }
  
  if (keyPressed && !isPressed) {
    isPressed = true;
    if (keyCode == LEFT) {
      turno = max(0, turno - 1 );
    } else if (keyCode == RIGHT) {
      turno++;
    }
    println(turno);
  } else if ( !keyPressed ) {
    isPressed = false;
  }
}


int nNo (int i) {
  return nNo(i, i);
}
int nNo (int i, int ant) {
  if ( i+1 > N ) {
    return ant;
  }
  int r = 0;
  switch(i+1) {
    case  4: r = 16; break;
    case 12: r = 33; break;
    case 18: r = 22; break;
    case 26: r = 37; break;
    case 42: r = 61; break;
    case 49: r = 51; break;
    case 55: r = 74; break;
    case 82: r = 98; break;
    case 85: r = 95; break;
    case 88: r = 92; break;
    case 21: r =  3; break;
    case 24: r =  6; break;
    case 35: r =  9; break;
    case 50: r = 11; break;
    case 53: r = 15; break;
    case 60: r = 23; break;
    case 75: r = 44; break;
    case 89: r = 48; break;
    case 93: r = 25; break;
    case 97: r = 65; break;
    case 99: r = 58; break;
    default: r = i+1;
  }
  return (r-1);



}
int getX (int i) {
  int r = i%row;
  if ( i % (row * 2) < row ) {
    return r;
  } else {
    return row - r-1;
  }
}
int getY (int i) {
  return row - int(i/row) -1;
}

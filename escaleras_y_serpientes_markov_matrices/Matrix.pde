class Matrix {

  int m, n;
  float [][] e;
  
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Constructor
  Matrix (float [][] elementos) {
    e = elementos;
    m = elementos.length;
    n = elementos[0].length;
  }
  Matrix (int x, int y) {
    e = new float[x][y];
    m = x;
    n = y;
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Multiplicar
  Matrix mult (Matrix o) {
    if( n != o.m ) {
      return null;
    }
    Matrix temp = new Matrix(m, o.n);
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < o.n; j++) {
        float resultado = 0;
        for (int k = 0; k < n; k++) {
          resultado += getElement(i, k)*o.getElement(k, j);
        }
        temp.setElement(i, j, resultado);
      }
    }
    
    
    return temp;  
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Sumar
  Matrix add (Matrix o) {
    if( o.m != m || o.n != n ) {
      return null;
    }
    Matrix temp = new Matrix(m, n);
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        temp.setElement(i, j,        getElement(i, j) + o.getElement(i, j)           );
      }
    }
    
    return temp;
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Obtener traspuesta
  Matrix t () {
    Matrix temp = new Matrix(n, m);
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        temp.setElement(j,i,e[i][j]);
      }
    }
    
    return temp;
  }
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Obtener elemento
  float getElement (int i, int j) {
    return e[i][j];
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Establecer elemento
  void setElement (int i, int j, float elemento) {
    e[i][j] = elemento;
  }
  //-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Devuelve una copia de esta matriz
  Matrix copy () {
    return new Matrix(e);
  }

}

class Tesseract
{
  Vector4d A_,B_,C_,D_,E_,F_,G_,H_,I_,J_,K_,L_,M_,N_,O_,P_;
  
  Tesseract()
  {
    A_=new Vector4d(1,1,1,3);
    A_=A_.divide(sqrt(2));
    B_=new Vector4d(-1,1,1,3);
    B_=B_.divide(sqrt(2));
    C_=new Vector4d(-1,1,-1,3);
    C_=C_.divide(sqrt(2));
    D_=new Vector4d(1,1,-1,3);
    D_=D_.divide(sqrt(2));
    
    E_=new Vector4d(1,-1,1,3);
    E_=E_.divide(sqrt(2));
    F_=new Vector4d(-1,-1,1,3);
    F_=F_.divide(sqrt(2));
    G_=new Vector4d(-1,-1,-1,3);
    G_=G_.divide(sqrt(2));
    H_=new Vector4d(1,-1,-1,3);
    H_=H_.divide(sqrt(2));
    
    I_=new Vector4d(1,1,1,1);
    I_=I_.divide(sqrt(2));
    J_=new Vector4d(-1,1,1,1);
    J_=J_.divide(sqrt(2));
    K_=new Vector4d(-1,1,-1,1);
    K_=K_.divide(sqrt(2));
    L_=new Vector4d(1,1,-1,1);
    L_=L_.divide(sqrt(2));
    
    M_=new Vector4d(1,-1,1,1);
    M_=M_.divide(sqrt(2));
    N_=new Vector4d(-1,-1,1,1);
    N_=N_.divide(sqrt(2));
    O_=new Vector4d(-1,-1,-1,1);
    O_=O_.divide(sqrt(2));
    P_=new Vector4d(1,-1,-1,1);
    P_=P_.divide(sqrt(2));
  }
  
  void show()
  {
    A_.line4d(B_);
    A_.line4d(D_);
    A_.line4d(E_);
    A_.line4d(I_);
    C_.line4d(B_);
    C_.line4d(D_);
    C_.line4d(G_);
    C_.line4d(K_);
    F_.line4d(B_);
    F_.line4d(E_);
    F_.line4d(G_);
    F_.line4d(N_);
    H_.line4d(D_);
    H_.line4d(E_);
    H_.line4d(G_);
    H_.line4d(P_);
    J_.line4d(I_);
    J_.line4d(K_);
    J_.line4d(N_);
    J_.line4d(B_);
    L_.line4d(I_);
    L_.line4d(K_);
    L_.line4d(P_);
    L_.line4d(D_);
    M_.line4d(N_);
    M_.line4d(P_);
    M_.line4d(I_);
    M_.line4d(E_);
    O_.line4d(N_);
    O_.line4d(P_);
    O_.line4d(K_);
    O_.line4d(G_);
    
  }
  
  Vector4d MP(Vector4d v1, Vector4d v2, Vector4d v3,Vector4d v4)
  {
    return v4.sum(v1.sum(v2.sum(v3))).divide(4);
  }
  
  void rotateSidexw(Vector4d P1,Vector4d P2, Vector4d P3, Vector4d P4,float phi)
  {
    Vector4d M=this.MP(P1,P2,P3,P4);
    P4.rotatexw(M,phi);
    P1.rotatexw(M,phi);
    P2.rotatexw(M,phi);
    P3.rotatexw(M,phi);
  }
  
  void rotatexw()
  {
    this.rotateSidexw(B_,I_,J_,A_,0.01);
    this.rotateSidexw(F_,M_,N_,E_,0.01);
    this.rotateSidexw(D_,K_,L_,C_,0.01);
    this.rotateSidexw(H_,O_,P_,G_,0.01);
    /*this.A_.rotateSidexw(B_,I_,J_,0.01);
    this.E_.rotateSidexw(F_,M_,N_,0.01);
    this.C_.rotateSidexw(D_,K_,L_,0.01);
    this.G_.rotateSidexw(H_,O_,P_,0.01);*/
  }
}
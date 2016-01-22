class Vector4d
{
  float x_,y_,z_,w_;

  Vector4d(float x,float y, float z,float w) 
  {
    x_=x;
    y_=y;
    z_=z;
    w_=w;
  }
  
  Vector4d map3d()
  {
    Vector4d v=new Vector4d(this.x_*this.w_,this.y_*this.w_,this.z_*this.w_,0);
    return v;
  }
  
  Vector4d map2d()
  {
    Vector4d v=new Vector4d(width/2+(this.x_-this.z_/3.)*80.,height/2+(this.y_+this.z_*2./3.)*80.,0,0);
    return v;
  }
  
  void show()
  {
    point(this.map3d().map2d().x_,this.map3d().map2d().y_);
  }
  
  void line4d(Vector4d v)
  {
    line(this.map3d().map2d().x_,this.map3d().map2d().y_,v.map3d().map2d().x_,v.map3d().map2d().y_);
  }

  Vector4d dif(Vector4d v)
  {
    Vector4d w = new Vector4d(this.x_-v.x_,this.y_-v.y_,this.z_-v.z_,this.w_-v.w_);
    return w;
  }
  
  Vector4d sum(Vector4d v)
  {
    Vector4d w = new Vector4d(this.x_+v.x_,this.y_+v.y_,this.z_+v.z_,this.w_+v.w_);
    return w;
  }
  
  Vector4d divide(float x)
  {
    Vector4d v= new Vector4d(this.x_/x,this.y_/x,this.z_/x,this.w_/x);
    return v;
  }
  
  /*Vector4d multiply(float x)
  {
    Vector4d v= new Vector4d(this.x_*x,this.y_*x,this.z_*x,this.w_*x);
    return v;
  }*/
  
  /*float euclidnorm()
  {
    return sqrt(this.x_*this.x_+this.y_*this.y_+this.z_*this.z_+this.w_*this.w_);
  }*/

  float getAngel()
  {
    float phi;
    if(this.w_>=0)
      phi=acos(((1+this.x_)%2)-1); //begrenzt den Input von -1 bis 1
    else
      phi=2*PI-acos(((1+this.x_)%2)-1);
      //phi=2*PI-acos(((1+this.x_)%2)-1);
    return phi;
  }
  
  /*Vector4d MP(Vector4d v1, Vector4d v2, Vector4d v3)
  {
    return this.sum(v1.sum(v2.sum(v3))).divide(4);
  }*/
  
  void rotatexw(Vector4d MP,float phi)
  {
    Vector4d v=this.dif(MP);
    float phi0=v.getAngel()+phi; 
    v.x_=cos((2*PI+phi0)%(2*PI)); //Modulo 2*PI
    v.w_=sin((2*PI+phi0)%(2*PI));
    this.x_=MP.x_+v.x_;
    this.w_=MP.w_+v.w_;
  }
  
  /*void rotateSidexw(Vector4d P1,Vector4d P2, Vector4d P3,float phi)
  {
    Vector4d M=this.MP(P1,P2,P3);
    this.rotatexw(M,phi);
    P1.rotatexw(M,phi);
    P2.rotatexw(M,phi);
    P3.rotatexw(M,phi);
  }*/
}
class Vector 
{
    int x;
    int y;
 
    Vector(int x_, int y_) 
    {
        x = x_;
        y = y_;
    }

    Vector copy()
    {
        return new Vector(x, y);
    }

    void add(Vector v) 
    {
        x += v.x;
        y += v.y;
    }

    void sub(Vector v)
    {
        x -= v.x;
        y -= v.y;
    }

    void mult(int scalar)
    {
        x *= scalar;
        y *= scalar;
    }

    double modulus()
    {
        return sqrt(x*x + y*y);
    }

    double dist(Vector v)
    {
        Vector u = new Vector(x, y);
        u.sub(v);
        return u.modulus();
    }
}
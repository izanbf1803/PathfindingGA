class DNA
{
    final Vector[] directions = {
        new Vector(-1, 0),
        new Vector(1, 0),
        new Vector(0, -1),
        new Vector(0, 1),
        new Vector(-1, -1),
        new Vector(1, 1),
        new Vector(1, -1),
        new Vector(-1, 1),
    };
    Vector[] genes;

    DNA() 
    {
        genes = new Vector[lifetime];
        for (int i = 0; i < genes.length; ++i) {
            int rand = (int)random(0, directions.length);
            genes[i] = directions[rand].copy();
        }
    }
}
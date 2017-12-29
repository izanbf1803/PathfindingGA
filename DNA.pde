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
    }

    Vector randomGene()
    {
        int rand = (int)random(0, directions.length); // [0, directions.length-1] (int)
        return directions[rand].copy();
    }

    void randomGenes()
    {
        for (int i = 0; i < genes.length; ++i) {
            genes[i] = randomGene();
        }
    }
}
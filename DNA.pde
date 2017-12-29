class DNA
{
    Vector[] genes;

    DNA(int lifetime) 
    {
        genes = new Vector[lifetime];
        for (int i = 0; i < genes.length; ++i) {
            genes[i] = new Vector(int(random(-1, 1)), int(random(-1, 1)));
        }
    }
}
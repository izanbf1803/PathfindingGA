class Cell
{
    Vector pos;
    DNA dna;

    Cell()
    {
        pos = initialPos.copy();
        dna = new DNA();
    }

    void update(int step)
    {
        pos.add(dna.genes[step]);
    }

    double fitness(Vector target)
    {
        double d = pos.dist(target);
        double d_inv = 1 / d;
        return d_inv * d_inv;
    }
}
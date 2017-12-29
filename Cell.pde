class Cell
{
    Vector pos;
    DNA dna;

    Cell(Vector pos_, int lifetime)
    {
        pos = pos_;
        dna = new DNA(lifetime);
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
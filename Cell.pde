class Cell
{
    Vector pos;
    DNA dna;
    boolean target_found;

    Cell()
    {
        pos = initialPos.copy();
        dna = new DNA();
        target_found = false;
    }

    void genRandomDNA()
    {
        dna.randomGenes();
    }

    void update(int step)
    {
        if (!target_found) {
            pos.add(dna.genes[step]);
            if (pos.x == target.x && pos.y == target.y) {
                target_found = true;
            }
        }
    }

    double fitness()
    {
        double d = pos.dist(target);
        double d_inv = 1 / d;
        double score = d_inv * d_inv;
        if (target_found) {
            score += target_found_bonus;
        }
        return score;
    }
}
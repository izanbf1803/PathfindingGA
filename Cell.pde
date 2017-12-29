class Cell
{
    Vector pos;
    DNA dna;
    double target_found_step;

    Cell()
    {
        pos = initialPos.copy();
        dna = new DNA();
        target_found_step = -1;
    }

    void genRandomDNA()
    {
        dna.randomGenes();
    }

    void update(int step)
    {
        if (target_found_step == -1) {
            pos.add(dna.genes[step]);
            if (pos.x == target.x && pos.y == target.y) {
                target_found_step = step;
            }
        }
    }

    double fitness()
    {
        double d = pos.dist(target) + 1;
        double d_inv = 1 / d;
        double score = d_inv * d_inv;
        score /= 2; // Max score without reaching target: 0.5
        if (target_found_step != -1) {
            // If target reached, max score: < 1
            score += (target_found_step / lifetime) / 2;
        }
        return score;
    }
}
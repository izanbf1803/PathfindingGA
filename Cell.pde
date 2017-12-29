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
        double d = pos.dist(target);
        double d_inv = 1 / d;
        double score = d_inv * d_inv;
        if (target_found_step != -1) {
            double bonus_score = 1 - target_found_step / lifetime;
            if (score + bonus_score < 1) {
                score += bonus_score;
            }
            else {
                score = 1;
            }
        }
        return score;
    }
}
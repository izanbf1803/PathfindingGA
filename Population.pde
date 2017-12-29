class Population
{
    Cell[] cells;
    Cell[] matingPool;
    double[] score;
    int generations;
    int step;

    Population()
    {
        step = -1;
        generations = 1;
        cells = new Cell[population_size];
        for (int i = 0; i < cells.length; ++i) {
            cells[i] = new Cell();
            cells[i].genRandomDNA();
        }
    }

    void draw()
    {
        for (int i = 0; i < cells.length; ++i) {
            Vector p = cells[i].pos;
            for (int j = -scale/2; j < scale/2; ++j) {
                for (int k = -scale/2; k < scale/2; ++k) {
                    point(p.x + j, p.y + k);
                }
            }
        }
    }

    void update()
    {
        ++step;
        if (step < lifetime) {
            for (int i = 0; i < cells.length; ++i) {
                cells[i].update(step);
            }
        }
        else {
            step = -1;
            ++generations;
            this.fitness();
            this.selection();
            this.reproduction();
            this.update();
        }
    }

    void fitness()
    {
        score = new double[cells.length];
        double score_sum = 0;
        for (int i = 0; i < cells.length; ++i) {
            score[i] = cells[i].fitness();
            score_sum += score[i];
        }
        // Normalize scores (make sum of scores = 1):
        for (int i = 0; i < cells.length; ++i) {
            score[i] /= score_sum;
        }
    }

    void selection()
    {
        // Select cells randomly to reproduce:
        int N = 2 * cells.length;
        matingPool = new Cell[N];
        int index = 0;
        for (int i = 0; i < cells.length; ++i) {
            for (int j = 0; j < N * score[i] && index < N; ++j) {
                matingPool[index] = cells[i];
                ++index;
            }
        }
    }

    void reproduction()
    {
        Cell[] children = new Cell[cells.length];
        for (int i = 0; i < cells.length; ++i) {
            children[i] = new Cell();
            for (int j = 0; j < lifetime; ++j) {
                if (random(0, 1) <= mutationRate) { // [0, 1) (float)
                    children[i].dna.genes[j] = children[i].dna.randomGene(); // mutate
                }
                else {
                    int parentIndex = 2 * i + (int)random(0, 2); // [0, 1] (int)
                    children[i].dna.genes[j] = matingPool[parentIndex].dna.genes[j];
                }
            }
        }
        cells = children; // next generation
    }
}
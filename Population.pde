class Population
{
    double mutationRate;
    int lifetime;
    Cell[] population;
    ArrayList<Cell> matingPool;
    int generations;
    int step;

    Population(double mutationRate_, int lifetime_, int population_)
    {
        step = -1;
        mutationRate = mutationRate_;
        lifetime = lifetime_;
        population = new Cell[population_];
        for (int i = 0; i < population.length; ++i) {
            population[i] = new Cell(new Vector(0, 0), lifetime);
        }
    }

    void draw()
    {
        for (int i = 0; i < population.length; ++i) {
            Vector p = population[i].pos;
            point(p.x, p.y);
        }
    }

    void update()
    {
        ++step;
        if (step < lifetime) {
            for (int i = 0; i < population.length; ++i) {
                population[i].update(step);
            }
            this.draw();
        }
        else {
            step = -1;
            this.fitness();
            this.selection();
            this.reproduction();
        }
    }

    void fitness()
    {

    }

    void selection()
    {

    }

    void reproduction()
    {

    }
}
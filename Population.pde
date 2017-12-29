class Population
{
    Cell[] cells;
    ArrayList<Cell> matingPool;
    int generations;
    int step;

    Population()
    {
        step = -1;
        generations = 1;
        cells = new Cell[population_size];
        for (int i = 0; i < cells.length; ++i) {
            cells[i] = new Cell();
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
            println(step);
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

    }

    void selection()
    {

    }

    void reproduction()
    {

    }
}
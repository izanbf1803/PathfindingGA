Population population;

final double mutationRate = 0.01;
final int population_size = 50;
final int lifetime = 100;

void setup() 
{
    population = new Population(mutationRate, lifetime, population_size);
    size(800, 600);
}

void draw()
{
    background(255);
    population.update();
}
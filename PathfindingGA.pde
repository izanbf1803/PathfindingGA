final double mutationRate = 5 / 100;
final int population_size = 128;
final int lifetime = 10000;
final int scale = 4;
final int width_ = 800;
final int height_ = 600;
final int fps = 30;
final int steps_per_second = 2500;
final Vector initialPos = new Vector(width_/2, height_/2);
final Vector target = new Vector(width_/2, height_/6);

PFont f;
Population population;
int vOffset;
int updates_per_frame;

void setup() 
{
    size(800, 600);
    frameRate(fps);
    f = createFont("Arial", 16, true);
    updates_per_frame = steps_per_second / fps;
    population = new Population();
}

void draw()
{
    background(255);
    stroke(#00ff00);
    // Draw target
    for (int i = -scale; i < scale; ++i) {
        for (int j = -scale; j < scale; ++j) {
            point(target.x + i, target.y + j);
        }
    }
    stroke(#ff0000);
    for (int i = 0; i < updates_per_frame; ++i) {
        population.update();
    }
    population.draw();
    drawInfo();
}

void drawInfo()
{
    textFont(f, 16);
    vOffset = 0;
    fill(#0000ff);
    info("Generation " + str(population.generations));
    info("Step " + str(population.step));
}

void info(String info_)
{
    vOffset += 16;
    text(info_, 16, height_ - vOffset);
}
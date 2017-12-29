final double mutationRate = 0.01;
final int population_size = 200;
final int lifetime = 100;
final int updates_per_frame = 1;
final int scale = 4;
final int width_ = 800;
final int height_ = 600;
final int fps = 15;
final Vector initialPos = new Vector(width_/2, height_/2);
final Vector target = new Vector(width_/2, scale);

PFont f;
Population population;
int vOffset;

void setup() 
{
    surface.setSize(width_, height_);
    frameRate(fps);
    f = createFont("Arial", 16, true);
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
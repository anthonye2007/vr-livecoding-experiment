class Cube
  attr_reader :x, :y, :z
  attr_writer :x, :y, :z

  MAX_DISTANCE = 5

  def initialize
    while (true)
      randomizePositions
      @z += 1 if @y <= 1

      break if reachable?
      puts "Could not reach: #{to_s}"
    end
  end

  def randomizePositions
    @x = rand(-3...3) + rand(0...10) / 10.0
    @y = rand(0...2) + rand(0...10) / 10.0
    @z = rand(0...3) + rand(0...10) / 10.0
  end

  def reachable?
    return distance < MAX_DISTANCE
  end

  def distance
    return Math.sqrt(@x**2 + @y**2 + @z**2)
  end

  def to_s
    return "#{@x.to_s}, #{@y.to_s}, #{@z.to_s}"
  end
end

#maxes for cube
# 3.2, 2.9, 3.1 -- 5.32
# -0.7, 2.4, 2.1 -- 3.26 (scroll limit)
# -4.2, 3, 1.7 -- 5.43
# 4.3, 2.3, 0.6 -- 4.91 (scroll limit)
# 4.30, 2.6, -6.1 -- 7.90 (after scrolling)
# Full hand can reach ~5 units away from origin

# Constraints:
  # Cube must be within 5 units of origin
  # Target must be within 5 units of origin
  # Target must be within 5 units of cube
  # y must be between 0 and 3.1
    # starting at y=3.1 is fine
    # can go higher if z is also increased
  # x must be less than 4.2
  # x must be greater than -4
  # z must be greater than 0 (unless y is higher)
  # z must be less than 4

cube = Cube.new
puts "Cube: " + cube.to_s

target = Cube.new
puts "Target: " + target.to_s

file = File.open('temp.js', 'w')
file.write(
"var t3 = THREE;
var cube = new t3.Mesh(
    new t3.BoxGeometry(0.5, 0.5, 0.5),
    new t3.MeshLambertMaterial({color: 'blue'}));
cube.position.set(#{cube});
scene.add(cube);
cube.name = 'cube';


var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

const task = 'Positioning 1';
logger.log('Task: ' + task + '\tx: ' + cube.position.x + ', y: ' + cube.position.y + ', z: ' + cube.position.z);

/* DO NOT LOOK BELOW :)  */

var target = new t3.Mesh(
    new t3.BoxGeometry(0.5, 0.5, 0.5),
    new t3.MeshLambertMaterial({color: 'red'}));
target.position.set(#{target});
scene.add(target);"
)
file.close
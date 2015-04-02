class Cube
  attr_reader :x, :y, :z
  attr_writer :x, :y, :z

  def initialize
    @x = 0
    @y = 0
    @z = 0
  end

  def to_s
    return "#{@x.to_s}, #{@y.to_s}, #{@z.to_s}"
  end
end

cube = Cube.new
cube.x = rand(0...6)
cube.y = rand(0...4)
cube.z = rand(0...5)

puts "Cube: " + cube.to_s


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
target.name = 'target';
target.position.set(0.5, 2.2, 1.7);
scene.add(target);"
)
file.close
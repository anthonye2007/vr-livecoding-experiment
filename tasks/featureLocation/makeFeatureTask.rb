class Paddle
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

taskNum = ARGV[0] ? ARGV[0].to_i : 1
#taskNum = 1 if not taskNum
puts "Task: " + taskNum.to_s

for i in 1..taskNum
  cube = Paddle.new

  numPaddles = 11

  header = "var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var makePaddle = function () {
  var mesh = new t3.Mesh(
        new t3.BoxGeometry(0.55, 0.5, 0.15),
        new t3.MeshLambertMaterial({color: 'blue'}));
  mesh.position.set(3.64, 1, 1);
  return mesh;
}

"

  filename = i.to_s + '.js'
  file = File.open('generated/feature' + filename, 'w')
  file.write(header +
  "var secondPaddle = makePaddle();
secondPaddle.name = 'secondPaddle';
secondPaddle.position.x += 1.274;
secondPaddle.position.z = 8.34;
secondPaddle.material.color.setStyle('blue');
scene.add(secondPaddle);

var paddle1 = makePaddle();
paddle1.name = 'paddle1';
paddle1.position.x += 3.30;
paddle1.position.z = 7.17;
paddle1.material.color.setStyle('blue');
scene.add(paddle1);

var anotherPaddle = makePaddle();
anotherPaddle.name = 'anotherPaddle';
anotherPaddle.position.x += -3.75;
anotherPaddle.position.z += 1.80;
anotherPaddle.material.color.setStyle('blue');
scene.add(anotherPaddle);

var paddle7 = makePaddle();
paddle7.name = 'paddle7';
paddle7.position.z -= -0.03;
paddle7.position.x = -1.90;
paddle7.material.color.setStyle('blue');
scene.add(paddle7);

var paddle2 = makePaddle();
paddle2.name = 'paddle2';
paddle2.position.x += 0.63;
paddle2.position.z += 1.27;
paddle2.material.color.setStyle('blue');
scene.add(paddle2);

var paddle3 = makePaddle();
paddle3.name = 'paddle3';
paddle3.position.x += -7.14;
paddle3.position.z += 2.15;
paddle3.material.color.setStyle('blue');
scene.add(paddle3);

var paddle4 = makePaddle();
paddle4.name = 'paddle4';
paddle4.position.x += -2.99;
paddle4.position.z += -0.37;
paddle4.material.color.setStyle('blue');
scene.add(paddle4);

var paddle5 = makePaddle();
paddle5.name = 'paddle5';
paddle5.position.x += -7.99;
paddle5.position.z += 4.43;
paddle5.material.color.setStyle('blue');
scene.add(paddle5);

var paddle6 = makePaddle();
paddle6.name = 'paddle6';
paddle6.position.x += -4.45;
paddle6.position.z += -1.48;
paddle6.material.color.setStyle('blue');
scene.add(paddle6);

var otherPaddle = makePaddle();
otherPaddle.name = 'otherPaddle';
otherPaddle.position.z += 2.20;
otherPaddle.position.x -= 0.50;
otherPaddle.material.color.setStyle('blue');
scene.add(otherPaddle);

var paddle = makePaddle();
paddle.name = 'paddle';
paddle.position.z -= 0.32;
paddle.position.x = -3.13;
paddle.material.color.setStyle('blue');
scene.add(paddle);"
  )
  file.close
end
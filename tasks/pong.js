var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var initX = 3.64;
var initY = 1;
var initZ = 1;
var paddleWidth = 0.21;

var makePaddle = function () {
  var mesh = new t3.Mesh(
        new t3.BoxGeometry(0.55, 0.5, 0.15),
        new t3.MeshLambertMaterial({color: 'blue'}));
  mesh.position.set(initX, initY, initZ);
  return mesh;
}

var paddle = makePaddle();
paddle.name = 'paddle';
paddle.position.z -= 3.67;
paddle.position.x = 2.34;
scene.add(paddle);

var otherPaddle = makePaddle();
otherPaddle.name = 'otherPaddle';
scene.add(otherPaddle);

var anotherPaddle = makePaddle();
anotherPaddle.name = 'anotherPaddle';
anotherPaddle.position.x = -4.65;
anotherPaddle.position.z += 1.14;
scene.add(anotherPaddle);

var secondPaddle = makePaddle();
secondPaddle.name = 'secondPaddle';
secondPaddle.position.x = -4.47;
secondPaddle.position.z -= 3.65;
scene.add(secondPaddle);

var makeBall = function() {
 return new t3.Mesh(
        new t3.SphereGeometry(0.2),
        new t3.MeshLambertMaterial({color: 'red'}));
}

var ball = makeBall();
ball.name = 'ball';
ball.position.set(initX, initY, 0.75);
scene.add(ball);

var otherBall = makeBall();
otherBall.name = 'otherBall';
otherBall.position.set(secondPaddle.position.x, initY, 0.75);
scene.add(otherBall);

var direction = -1;
function animate() {
  if (ball.position.z <= paddle.position.z + paddleWidth || ball.position.z >= otherPaddle.position.z - paddleWidth) {
    direction *= -1;
  }
  ball.position.z += 0.1 * direction;
  otherBall.position.z += 0.1 * direction;
}

setInterval(animate, 20);
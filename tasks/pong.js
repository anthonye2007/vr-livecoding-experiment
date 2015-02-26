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
paddle.position.z -= 3.65;
scene.add(paddle);

var otherPaddle = makePaddle();
scene.add(otherPaddle);

var anotherPaddle = makePaddle();
anotherPaddle.position.x = -3.93;
scene.add(anotherPaddle);

var finalPaddle = makePaddle();
finalPaddle.position.x = -3.93;
finalPaddle.position.z -= 3.65;
scene.add(finalPaddle);

var makeBall = function() {
 return new t3.Mesh(
        new t3.SphereGeometry(0.2),
        new t3.MeshLambertMaterial({color: 'red'}));
}

var ball = makeBall();
ball.position.set(initX, initY, 0.75);
scene.add(ball);

var otherBall = makeBall();
otherBall.position.set(-3.93, initY, 0.75);
scene.add(otherBall);

var direction = -1;
function animate() {
  if (ball.position.z <= paddle.position.z + paddleWidth || ball.position.z >= otherPaddle.position.z - paddleWidth) {
    direction *= -1;
  }
  ball.position.z += 0.1 * direction;
  otherBall.position.z += 0.1 * direction;
}

setInterval(animate, 25);
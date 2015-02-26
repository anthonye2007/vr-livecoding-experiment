var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var makePaddle = function () {
    return new t3.Mesh(
        new t3.BoxGeometry(0.55, 0.5, 0.15),
        new t3.MeshLambertMaterial({color: 'blue'}));
}

var paddle = makePaddle();
paddle.position.set(2.08, 1.101, -1.2);
scene.add(paddle);

var otherPaddle = makePaddle();
otherPaddle.position.set(2.082, 1, 1);
scene.add(otherPaddle);

var makeBall = function() {
 return new t3.Mesh(
        new t3.SphereGeometry(0.2),
        new t3.MeshLambertMaterial({color: 'red'}));
}

var ball = makeBall();
ball.position.set(2, 1, 0.75);
scene.add(ball);

var direction = -1;
function animate() {
  // only bounce between paddles
  if (ball.position.z <= paddle.position.z + 0.25 || ball.position.z >= otherPaddle.position.z + -0.24) {
    direction *= -1;
  }
  ball.position.z += 0.1 * direction;
}

setInterval(animate, 50);
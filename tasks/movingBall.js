var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var makeBall = function() {
 return new t3.Mesh(
        new t3.SphereGeometry(0.2),
        new t3.MeshLambertMaterial({color: 'red'}));
}

var makePaddle = function () {
  var mesh = new t3.Mesh(
        new t3.BoxGeometry(0.55, 0.5, 0.15),
        new t3.MeshLambertMaterial({color: 'blue'}));
  mesh.position.set(3.2, 1.5, 2);
  return mesh;
}

var ball = makeBall();
ball.name = 'ball';
ball.position.set(1,1,0);
scene.add(ball);

var paddle = makePaddle();
paddle.name = 'paddle';
paddle.position.z -= 3.67;
paddle.position.x = 2.34;
scene.add(paddle);

var radius = 4;
var angle = 0;
var dAngle = Math.PI / 360;

return function() {
  ball.position.x = radius * Math.cos(angle);
  ball.position.z = radius * Math.sin(angle);
  angle += dAngle;
}
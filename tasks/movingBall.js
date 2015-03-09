var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var makeBall = function() {
 return new t3.Mesh(
        new t3.SphereGeometry(0.2),
        new t3.MeshLambertMaterial({color: 'red'}));
}

var ball = makeBall();
ball.position.set(1,1,1);
scene.add(ball);

var otherBall = makeBall();
otherBall.position.set(1, 1, 1);
scene.add(otherBall);

var radius = 4;
var angle = 0;
var otherAngle = Math.PI / 4;
var dAngle = Math.PI / 360;
var otherDangle = 2 * dAngle;

return function() {
  ball.position.x = radius * Math.cos(angle);
  ball.position.z = radius * Math.sin(angle);
  otherBall.position.x = radius * Math.cos(otherAngle);
  otherBall.position.z = radius * Math.sin(otherAngle);
  
  var scale = 100;

  angle += dAngle + 0 / scale;
  otherAngle += otherDangle + 0;
}
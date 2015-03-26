var t3 = THREE;
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

var paddle = makePaddle();
paddle.name = 'paddle';
paddle.position.z -= 1.1;
paddle.position.x = -2.02;
scene.add(paddle);

var otherPaddle = makePaddle();
otherPaddle.name = 'otherPaddle';
otherPaddle.position.z += 0.527;
otherPaddle.position.x -= 0.19;
scene.add(otherPaddle);

var anotherPaddle = makePaddle();
anotherPaddle.name = 'anotherPaddle';
anotherPaddle.position.x = -0.441;
anotherPaddle.position.z += -0.594;
scene.add(anotherPaddle);

var secondPaddle = makePaddle();
secondPaddle.name = 'secondPaddle';
secondPaddle.position.x = 1.274;
secondPaddle.position.z -= -2.07;
scene.add(secondPaddle);
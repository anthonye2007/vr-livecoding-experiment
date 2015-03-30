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

var secondPaddle = makePaddle();
secondPaddle.name = 'secondPaddle';
secondPaddle.position.x += -9.11;
secondPaddle.position.z = 3.48;
scene.add(secondPaddle);

var paddle1 = makePaddle();
paddle1.name = 'paddle1';
paddle1.position.x += -6.34;
paddle1.position.z = 4.44;
scene.add(paddle1);

var anotherPaddle = makePaddle();
anotherPaddle.name = 'anotherPaddle';
anotherPaddle.position.x += 1.45;
anotherPaddle.position.z += 2.17;
scene.add(anotherPaddle);

var paddle7 = makePaddle();
paddle7.name = 'paddle7';
paddle7.position.z -= -1.44;
paddle7.position.x = 3.63;
scene.add(paddle7);

var paddle2 = makePaddle();
paddle2.name = 'paddle2';
paddle2.position.x += -0.46;
paddle2.position.z += 0.79;
scene.add(paddle2);

var paddle3 = makePaddle();
paddle3.name = 'paddle3';
paddle3.position.x += -3.90;
paddle3.position.z += 0.10;
scene.add(paddle3);

var paddle4 = makePaddle();
paddle4.name = 'paddle4';
paddle4.position.x += -8.20;
paddle4.position.z += 1.35;
scene.add(paddle4);

var paddle5 = makePaddle();
paddle5.name = 'paddle5';
paddle5.position.x += -1.28;
paddle5.position.z += 3.93;
scene.add(paddle5);

var paddle6 = makePaddle();
paddle6.name = 'paddle6';
paddle6.position.x += -0.85;
paddle6.position.z += 2.93;
scene.add(paddle6);

var otherPaddle = makePaddle();
otherPaddle.name = 'otherPaddle';
otherPaddle.position.z += 1.81;
otherPaddle.position.x -= 7.58;
scene.add(otherPaddle);

var paddle = makePaddle();
paddle.name = 'paddle';
paddle.position.z -= -0.51;
paddle.position.x = 4.33;
scene.add(paddle);
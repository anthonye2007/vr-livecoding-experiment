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


var paddle1 = makePaddle();
paddle1.name = 'paddle1';
paddle1.position.x -= 0.8;
paddle1.position.z = 1.2;
paddle1.material.color.setStyle('blue');
scene.add(paddle1);

var paddle2 = makePaddle();
paddle2.name = 'paddle2';
paddle2.position.x -= 2.5;
paddle2.position.z += 2.1;
paddle2.material.color.setStyle('blue');
scene.add(paddle2);

var paddle3 = makePaddle();
paddle3.name = 'paddle3';
paddle3.position.x = -1.6;
paddle3.position.z = 3.5;
paddle3.material.color.setStyle('blue');
scene.add(paddle3);

var paddle4 = makePaddle();
paddle4.name = 'paddle4';
paddle4.position.x -= -1.4;
paddle4.position.z += 0.7;
paddle4.material.color.setStyle('blue');
scene.add(paddle4);

var paddle5 = makePaddle();
paddle5.name = 'paddle5';
paddle5.position.x = 1.3;
paddle5.position.z -= 1.4;
paddle5.material.color.setStyle('blue');
scene.add(paddle5);

var paddle6 = makePaddle();
paddle6.name = 'paddle6';
paddle6.position.x = 2.5;
paddle6.position.z -= 1.0;
paddle6.material.color.setStyle('blue');
scene.add(paddle6);

var paddle7 = makePaddle();
paddle7.name = 'paddle7';
paddle7.position.x = -1.4;
paddle7.position.z -= 1.4;
paddle7.material.color.setStyle('blue');
scene.add(paddle7);

var paddle8 = makePaddle();
paddle8.name = 'paddle8';
paddle8.position.x = 1.6;
paddle8.position.z = 2.0;
paddle8.material.color.setStyle('blue');
scene.add(paddle8);

var paddle9 = makePaddle();
paddle9.name = 'paddle9';
paddle9.position.x = 1.0;
paddle9.position.z += 1.3;
paddle9.material.color.setStyle('blue');
scene.add(paddle9);

var paddle10 = makePaddle();
paddle10.name = 'paddle10';
paddle10.position.x = -1.5;
paddle10.position.z = 2.1;
paddle10.material.color.setStyle('blue');
scene.add(paddle10);

var paddle11 = makePaddle();
paddle11.name = 'paddle11';
paddle11.position.x -= 2.3;
paddle11.position.z = 1.8;
paddle11.material.color.setStyle('blue');
scene.add(paddle11);

var paddle12 = makePaddle();
paddle12.name = 'paddle12';
paddle12.position.x += 1.3;
paddle12.position.z += 0.7;
paddle12.material.color.setStyle('blue');
scene.add(paddle12);

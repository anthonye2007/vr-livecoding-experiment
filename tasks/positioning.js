var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var makePaddle = function () {
  var mesh = new t3.Mesh(
        new t3.BoxGeometry(0.55, 0.5, 0.15),
        new t3.MeshLambertMaterial({color: 'blue'}));
  mesh.position.set(initX, initY, initZ);
  return mesh;
}

var cube = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'blue'}));
cube.position.set(2, 1, 2);
scene.add(cube);

var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'red'}));
target.position.set(4.23, 2.1, 4);
scene.add(target);
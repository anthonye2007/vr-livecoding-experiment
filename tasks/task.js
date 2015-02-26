var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'blue'}));
target.position.set(2, 2, 5);
scene.add(target);

var makeCube = function () {
    return new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'red'}));
}

var cube = makeCube();
cube.position.set(-3, 0, 2);
scene.add(cube);

var cube = makeCube();
cube.position.set(-1, 0, 2);
scene.add(cube);

var cube = makeCube();
cube.position.set(1, 0, 2);
scene.add(cube);

var cube = makeCube();
cube.position.set(3, 0, 2);
scene.add(cube);
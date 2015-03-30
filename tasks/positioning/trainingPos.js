var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var cube = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'blue'}));
cube.position.set(2.19, 0.90, 1.49);
cube.name = 'cube';
scene.add(cube);
var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'red'}));
target.name = 'target';
target.position.set(-11.75, 3.56, 3.64);
scene.add(target);
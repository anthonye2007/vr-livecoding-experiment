var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var cube = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial());
cube.position.set(2.19, 0.90, 1.49);
cube.material.color.setStyle('red');
cube.name = 'cube';
scene.add(cube);
var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial());
target.name = 'target';
target.position.set(-11.75, 3.56, 3.64);
target.material.color.setStyle('blue');
scene.add(target);
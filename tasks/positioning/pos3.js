const task = "Positioning 3";
var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var cube = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'blue'}));
cube.position.set(0.8, 1.3, 1.2);
cube.name = 'cube';
scene.add(cube);



logger.log("Task: " + task + "\tx: " + cube.position.x + ", y: " + cube.position.y + ", z: " + cube.position.z);

/* DO NOT LOOK BELOW :)  */

var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'red'}));
target.name = 'target';
target.position.set(-2.6, 2.3, 1.5);
scene.add(target);
const task = "Positioning 5";
var t3 = THREE;
var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

var cube = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'blue'}));
cube.position.set(-1.4, 1.7, 2.3);
cube.name = 'cube';
scene.add(cube);



logger.log("Task: " + task + "\tx: " + cube.position.x + ", y: " + cube.position.y + ", z: " + cube.position.z);

/* DO NOT LOOK BELOW :)  */

var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'red'}));
target.name = 'target';
target.position.set(1.9, 0.7, 0.7);
scene.add(target);
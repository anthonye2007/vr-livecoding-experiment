const task = "Positioning Training 5";
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




logger.log("Task: " + task + "\tx: " + cube.position.x + ", y: " + cube.position.y + ", z: " + cube.position.z);

/* DO NOT LOOK BELOW :)  */

var target = new t3.Mesh(
        new t3.BoxGeometry(0.5, 0.5, 0.5),
        new t3.MeshLambertMaterial({color: 'red'}));
target.name = 'target';
target.position.set(-9.90, 0.30, 1.33);
scene.add(target);
var t3 = THREE;
var cube = new t3.Mesh(
    new t3.BoxGeometry(0.5, 0.5, 0.5),
    new t3.MeshLambertMaterial({color: 'blue'}));
cube.position.set(2.2, 0.5, 1.7);
scene.add(cube);
cube.name = 'cube';


var light = new t3.PointLight();
light.position.set(-40, 15, -20);
scene.add(light);

const task = 'Positioning G 30';
logger.log('Task: ' + task + '	x: ' + cube.position.x + ', y: ' + cube.position.y + ', z: ' + cube.position.z);

/* DO NOT LOOK BELOW :)  */

var target = new t3.Mesh(
    new t3.BoxGeometry(0.5, 0.5, 0.5),
    new t3.MeshLambertMaterial({color: 'red'}));
target.position.set(1.0, 0.3, 3.5);
scene.add(target);
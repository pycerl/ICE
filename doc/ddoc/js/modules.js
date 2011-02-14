var g_moduleList = [
  "scene.scenemanager", "scene.lineemitter", "scene.particlesystem",
  "scene.linetrail", "scene.actorcontainer", "scene.actor",
  "scene.particleemitter", "file.fileio", "file.file", "math.math",
  "math.line2", "math.ssevector4", "math.vector2", "math.rectangle",
  "video.videodriver", "video.nodepacker", "video.fontmanager",
  "video.gltexture", "video.sdlglvideodriver", "video.glvideodriver",
  "video.font", "video.gltexturepage", "video.glshader", "video.glmonitor",
  "video.videodrivercontainer", "video.texture", "video.shader", "cdc",
  "time.time", "time.timer", "time.eventcounter", "gui.guimousecontrollable",
  "gui.guimenu", "gui.guilinegraph", "gui.guistatictext", "gui.guielement",
  "gui.guibutton", "stringctfe", "platform.platform", "platform.key",
  "platform.sdlplatform", "physics.physicsmonitor", "physics.physicsengine",
  "physics.contactdetect", "physics.contact", "physics.physicsbody",
  "util.iterator", "util.singleton", "util.factory", "util.signal",
  "util.weaksingleton", "image", "containers.array2d", "containers.array",
  "containers.vector", "color", "formats.mathparser", "graphdata", "pong",
  "monitor.submonitor", "monitor.monitormenu", "monitor.graphmonitor",
  "monitor.monitorable", "monitor.monitor", "memory.memorymonitorable",
  "memory.memory", "memory.memorymonitor", "spatial.gridspatialmanager",
  "spatial.spatialmanager", "spatial.gridmonitor", "spatial.volumecircle",
  "spatial.volumeaabbox", "spatial.volume",
];

var g_packageTree = new PackageTree(P('', [
  P('containers',[
    M('containers.array'),
    M('containers.array2d'),
    M('containers.vector'),
  ]),
  P('file',[
    M('file.file'),
    M('file.fileio'),
  ]),
  P('formats',[
    M('formats.mathparser'),
  ]),
  P('gui',[
    M('gui.guibutton'),
    M('gui.guielement'),
    M('gui.guilinegraph'),
    M('gui.guimenu'),
    M('gui.guimousecontrollable'),
    M('gui.guistatictext'),
  ]),
  P('math',[
    M('math.line2'),
    M('math.math'),
    M('math.rectangle'),
    M('math.ssevector4'),
    M('math.vector2'),
  ]),
  P('memory',[
    M('memory.memory'),
    M('memory.memorymonitor'),
    M('memory.memorymonitorable'),
  ]),
  P('monitor',[
    M('monitor.graphmonitor'),
    M('monitor.monitor'),
    M('monitor.monitorable'),
    M('monitor.monitormenu'),
    M('monitor.submonitor'),
  ]),
  P('physics',[
    M('physics.contact'),
    M('physics.contactdetect'),
    M('physics.physicsbody'),
    M('physics.physicsengine'),
    M('physics.physicsmonitor'),
  ]),
  P('platform',[
    M('platform.key'),
    M('platform.platform'),
    M('platform.sdlplatform'),
  ]),
  P('scene',[
    M('scene.actor'),
    M('scene.actorcontainer'),
    M('scene.lineemitter'),
    M('scene.linetrail'),
    M('scene.particleemitter'),
    M('scene.particlesystem'),
    M('scene.scenemanager'),
  ]),
  P('spatial',[
    M('spatial.gridmonitor'),
    M('spatial.gridspatialmanager'),
    M('spatial.spatialmanager'),
    M('spatial.volume'),
    M('spatial.volumeaabbox'),
    M('spatial.volumecircle'),
  ]),
  P('time',[
    M('time.eventcounter'),
    M('time.time'),
    M('time.timer'),
  ]),
  P('util',[
    M('util.factory'),
    M('util.iterator'),
    M('util.signal'),
    M('util.singleton'),
    M('util.weaksingleton'),
  ]),
  P('video',[
    M('video.font'),
    M('video.fontmanager'),
    M('video.glmonitor'),
    M('video.glshader'),
    M('video.gltexture'),
    M('video.gltexturepage'),
    M('video.glvideodriver'),
    M('video.nodepacker'),
    M('video.sdlglvideodriver'),
    M('video.shader'),
    M('video.texture'),
    M('video.videodriver'),
    M('video.videodrivercontainer'),
  ]),
  M('cdc'),
  M('color'),
  M('graphdata'),
  M('image'),
  M('pong'),
  M('stringctfe'),
])
);

var g_creationTime = 1297723208;

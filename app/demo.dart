
import 'dart:html';

import 'package:chrome_gen/chrome_app.dart' as chrome;

void main() {
  label('alarms');
  action("create()", handleAlarmsCreate);
  br();

  label('app_window');
  action("create()", handleAppWindowCreate);
  action("create.options()", handleAppWindowCreateOptions);
  action("close()", () => chrome.app_window.current().close());
  action("fullscreen()", () => chrome.app_window.current().fullscreen());
  br();

  label('i18n');
  action("message()", handleI18NMessage);
  action("languages()", handleI18NLanguages);
  br();

  label('idle');
  action('queryState()', handleIdleQueryState);
  br();

  label('permissions');
  action('getAll()', handlePermissionsGetAll);
  action('getAll().origins', handlePermissionsOrigins);
  br();

  label('runtime');
  action("id", handleRuntimeId);
  action("path", handleRuntimeURL);
  action("reload()", handleRuntimeReload);
  action('getManifest()', handleRuntimeGetManifest);
  action('getPlatformInfo()', handleGetPlatformInfo);
  action('getPackageDirectoryEntry()', handleGetPackageDirectoryEntry);
  br();

  label('socket');
  action('read()', handleSocketRead);
  action('read() error', handleSocketReadError);
  br();

  label('system');
  action('cpu.info', handleSystemCpu);
  action('cpu.memory', handleSystemMemory);
  br();

  label('tts');
  action('getVoices()', handleGetVoices);
  action('speak()', () => chrome.tts.speak('Hello World'));
  br();

  chrome.runtime.onStartup.listen((e) {
    notes('onStartup');
  });

  chrome.alarms.onAlarm.listen((e) {
    notes('onAlarm: ${e}');
  });
}

void label(String str) {
  SpanElement span = new SpanElement();
  span.text = str;
  query('#container_id').children.add(span);
}

void action(String name, Function callback) {
  ButtonElement button = new ButtonElement();
  button.text = name;
  button.onClick.listen((e) => callback());

  query('#container_id').children.add(button);
}

void br() {
  query('#container_id').children.add(new BRElement());
}

void summary(String str) {
  query("#summary").text = "[${str}]";
}

void notes(String str) {
  query("#notes").text = str;
}

// actions

void handleI18NMessage() {
  summary(chrome.i18n.getMessage('foo'));
}

void handleI18NLanguages() {
  chrome.i18n.getAcceptLanguages().then((List<String> list) {
    summary(list.join(', '));
  });
}

void handleRuntimeId() {
  summary(chrome.runtime.id);
}

void handleRuntimeURL() {
  summary(chrome.runtime.getURL('foo'));
}

void handleRuntimeReload() {
  chrome.runtime.reload();
}

void handleIdleQueryState() {
  chrome.idle.queryState(15).then((String state) {
    summary(state);
  });
}

void handlePermissionsGetAll() {
  chrome.permissions.getAll().then((chrome.Permissions perms) {
    summary(perms.permissions.toString());
  });
}

void handlePermissionsOrigins() {
  chrome.permissions.getAll().then((chrome.Permissions perms) {
    summary(perms.origins.toString());
  });
}

void handleRuntimeGetManifest() {
  summary(chrome.runtime.getManifest().toString());
}

void handleGetVoices() {
  chrome.tts.getVoices().then((List<chrome.TtsVoice> voices) {
    String desc = voices.map((v) => "${v.voiceName} ${v.lang}").join(', ');
    summary(desc);
  });
}

void handleGetPlatformInfo() {
  chrome.runtime.getPlatformInfo().then((Map m) {
    summary(m.toString());
  });
}

void handleGetPackageDirectoryEntry() {
  chrome.runtime.getPackageDirectoryEntry().then((chrome.DirectoryEntry dir) {
    summary(dir.toString());
  });
}

void handleAlarmsCreate() {
  chrome.alarms.create(new chrome.AlarmCreateInfo(periodInMinutes: 1.0), 'myNewAlarm');
  summary('alarms.create: firing event in 1 minute');
}

void handleAppWindowCreate() {
  chrome.app_window.create('demo.html');
}

void handleAppWindowCreateOptions() {
  chrome.app_window.create('demo.html',
      new chrome.CreateWindowOptions(width: 1200, height: 200));
}

void handleSystemCpu() {
  chrome.system_cpu.getInfo().then((chrome.CpuInfo info) {
    summary('${info.archName}: ${info.numOfProcessors} processors');
  });
}

void handleSystemMemory() {
  chrome.system_memory.getInfo().then((chrome.MemoryInfo info) {
    summary('${info.capacity} bytes');
  });
}

void handleSocketRead() {
  summary("starting read...");

  int socketId = 0;

  chrome.socket.create(chrome.SocketType.TCP).then((chrome.CreateInfo info) {
    socketId = info.socketId;
    print("socketId: ${socketId}");
    return chrome.socket.connect(socketId, 'www.google.com', 80);
  }).then((int code) {
    print("code: ${code}");
    chrome.socket.write(socketId, new chrome.ArrayBuffer.fromString('HEAD /robots.txt HTTP/1.0\r\n\r\n'));
    return chrome.socket.read(socketId);
  }).then((chrome.SocketReadInfo info) {
    print("info.resultCode: ${info.resultCode}");
    String str = new String.fromCharCodes(info.data.getBytes());
    summary(str);
    return chrome.socket.read(socketId);
  }).then((chrome.SocketReadInfo info) {
    // info.resultCode should == -15
    print("info.resultCode: ${info.resultCode}");
  }).catchError((e) {
    summary("error: ${e}");
  });
}

void handleSocketReadError() {
  int socketId = 0;

  chrome.socket.create(chrome.SocketType.TCP).then((chrome.CreateInfo info) {
    socketId = info.socketId;
    print("socketId: ${socketId}");
    return chrome.socket.connect(socketId, 'www.google.com', 80);
  }).then((int code) {
    print("code: ${code}");
    chrome.socket.destroy(socketId);
    return chrome.socket.read(socketId);
  }).then((chrome.SocketReadInfo info) {
    summary("info.resultCode: ${info.resultCode}");
  }).catchError((e) {
    summary("error: ${e}");
  });
}

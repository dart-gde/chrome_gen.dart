
import 'dart:async';
import 'dart:html';

import 'package:chrome_gen/chrome_app.dart' as chrome;

void main() {
  label('alarms');
  action("create()", handleAlarmsCreate);
  br();

  label('app.window');
  action("create()", handleAppWindowCreate);
  action("create.options()", handleAppWindowCreateOptions);
  action("close()", () => chrome.app.window.current().close());
  action("fullscreen()", () => chrome.app.window.current().fullscreen());
  br();

  label('audio');
  action("getInfo()", handleAudioGetInfo);
  br();

  label('files');
  action("read contents", handleFileRead);
  action("read contents (bytes)", handleFileReadBytes);
  action("get file", handleDirGetFile);
  action("dir info", handleDirInfo);
  action("dir listings", handleDirListings);
  br();

  label('files - modify');
  action("create", handleFileCreate);
  action("write", handleFileWrite);
  action("write (bytes)", handleFileWriteBytes);
  action("rename", handleFileRename);
  action("delete", handleFileDelete);
  br();

  label('fileSystem');
  action("chooseEntry", handleChooseEntry);
  action("chooseEntry (directory)", handleChooseEntryDir);
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
  action('requestUpdateCheck()', handleRuntimeRequestUpdateCheck);
  br();

  label('socket');
  action('read()', handleSocketRead);
  action('read() error', handleSocketReadError);
  br();

  label('storage');
  action("store / get", handleStorageStore);
  action("read prop", handleStorageProp);
  br();

  label('syncFileSystem');
  action("requestFileSystem()", handleRequestFileSystem);
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

  chrome.app.window.onFullscreened.listen((e) => print(e));
  chrome.app.window.onBoundsChanged.listen((e) => print(e));
  chrome.app.window.onClosed.listen((e) => print(e));
  chrome.app.window.onMaximized.listen((e) => print(e));
  chrome.app.window.onMinimized.listen((e) => print(e));
  chrome.app.window.onRestored.listen((e) => print(e));
}

void label(String str) {
  SpanElement span = new SpanElement();
  span.text = str;
  querySelector('#container_id').children.add(span);
}

void action(String name, Function callback) {
  ButtonElement button = new ButtonElement();
  button.text = name;
  button.onClick.listen((e) => callback());

  querySelector('#container_id').children.add(button);
}

void br() {
  querySelector('#container_id').children.add(new BRElement());
}

void summary(String str) {
  querySelector("#summary").text = "[${str}]";
}

void summaryFuture(Future future) {
  future.then((result) {
    summary('${result}');
  }).catchError((e) {
    summary('error: ${e}');
  });
}

void notes(String str) {
  querySelector("#notes").text = str;
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

void handleRuntimeRequestUpdateCheck() {
  chrome.runtime.requestUpdateCheck().then((chrome.RequestUpdateCheckResult result) {
    summary("${result}, status=${result.status}, ${result.details}");
  });
}

void handleAlarmsCreate() {
  chrome.alarms.create(new chrome.AlarmCreateInfo(periodInMinutes: 1.0), 'myNewAlarm');
  summary('alarms.create: firing event in 1 minute');
}

void handleAudioGetInfo() {
  chrome.audio.getInfo().then((chrome.GetInfoResult info) {
    summary("${info.outputInfo} ${info.inputInfo}");
  });
}

void handleAppWindowCreate() {
  chrome.app.window.create('demo.html');
}

void handleAppWindowCreateOptions() {
  chrome.app.window.create('demo.html',
      new chrome.CreateWindowOptions(width: 1200, height: 200));
}

void handleSystemCpu() {
  chrome.system.cpu.getInfo().then((chrome.CpuInfo info) {
    summary('${info.archName}: ${info.numOfProcessors} processors');
  });
}

void handleSystemMemory() {
  chrome.system.memory.getInfo().then((chrome.MemoryInfo info) {
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

void handleStorageStore() {
  summaryFuture(chrome.storage.local.set({'foo': 'bar'}).then((_) {
    return chrome.storage.local.get(['foo']);
  }));
}

void handleStorageProp() {
  summary('max ops per minute = ' + chrome.storage.sync.MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE.toString());
}

void handleChooseEntry() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);
  chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    summary("result: ${result}, ${result.entry}, name=${result.entry.name}, fullPath=${result.entry.fullPath}");
  });
}

void handleChooseEntryDir() {
  // this will fail on older versions of chrome
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_DIRECTORY);
  chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    summary("result: ${result}, ${result.entry}, name=${result.entry.name}, fullPath=${result.entry.fullPath}");
  });
}

void handleRequestFileSystem() {
  summaryFuture(chrome.syncFileSystem.requestFileSystem());
}

void handleFileRead() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.ChromeFileEntry entry = result.entry;
    return entry.readText();
  });

  summaryFuture(f);
}

void handleFileReadBytes() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.ChromeFileEntry entry = result.entry;
    return entry.readBytes().then((chrome.ArrayBuffer buf) {
      return "read ${buf.getBytes().length} bytes";
    });
  });

  summaryFuture(f);
}

void handleDirInfo() {
  List items = [];

  chrome.runtime.getPackageDirectoryEntry().then((chrome.DirectoryEntry dir) {
    items.add("filesystem: ${dir.filesystem}");
    items.add("fullPath: ${dir.fullPath}");
    items.add("isDirectory: ${dir.isDirectory}");
    items.add("isFile: ${dir.isFile}");
    items.add("name: ${dir.name}");

    summary(items.join(', '));
  });
}

void handleDirGetFile() {
  chrome.runtime.getPackageDirectoryEntry().then((chrome.DirectoryEntry dir) {
    dir.getFile('manifest.json').then((Entry entry) {
      summary("file: ${entry}");
    });
  });
}

void handleDirListings() {
  chrome.runtime.getPackageDirectoryEntry().then((chrome.DirectoryEntry dir) {
    dir.createReader().readEntries().then((List<Entry> entries) {
      summary(entries.join(', '));
    });
  });
}

void handleFileCreate() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_DIRECTORY);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.DirectoryEntry entry = result.entry;

    return entry.createFile("myfoofile.txt").then((Entry fileEntry) {
      return "created ${fileEntry.name}, ${fileEntry.fullPath}";
    });
  });

  summaryFuture(f);
}

void handleFileWrite() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.ChromeFileEntry entry = result.entry;

    return entry.writeText("foo bar baz").then((_) {
      return "choose: ${entry.name}; written successfully";
    });
  });

  summaryFuture(f);
}

void handleFileWriteBytes() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.ChromeFileEntry entry = result.entry;
    chrome.ArrayBuffer buf = new chrome.ArrayBuffer.fromBytes([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

    List<int> data = buf.getBytes();
    print(data);

    return entry.writeBytes(buf).then((_) {
      return "choose: ${entry.name}; written successfully";
    });
  });

  summaryFuture(f);
}

void handleFileRename() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.ChromeFileEntry entry = result.entry;

    return entry.getParent().then((Entry parent) {
      return entry.moveTo(parent, name: entry.name + ".new");
    });
  });

  summaryFuture(f);
}

void handleFileDelete() {
  chrome.ChooseEntryOptions options = new chrome.ChooseEntryOptions(type: chrome.ChooseEntryType.OPEN_WRITABLE_FILE);

  Future f = chrome.fileSystem.chooseEntry(options).then((chrome.ChooseEntryResult result) {
    chrome.ChromeFileEntry entry = result.entry;

    return entry.remove().then((_) {
      return "delete successful";
    });
  });

  summaryFuture(f);
}

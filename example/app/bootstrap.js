
if (navigator.userAgent.indexOf('(Dart)') === -1) {
  var script = document.createElement('script');
  script.src = 'demo.dart.precompiled.js';
  document.body.appendChild(script);
}

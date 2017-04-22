// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

bool terminalSupportsAnsi() {
  return !Platform.isWindows && stdioType(stdout) == StdioType.TERMINAL;
}

class Ansi {
  final bool useAnsi;

  String get cyan => _code('\u001b[36m');
  String get green => _code('\u001b[32m');
  String get magenta => _code('\u001b[35m');
  String get red => _code('\u001b[31m');
  String get yellow => _code('\u001b[33m');
  String get blue => _code('\u001b[34m');
  String get gray => _code('\u001b[1;30m');
  String get noColor => _code('\u001b[39m');

  String get none => _code('\u001b[0m');

  String get bold => _code('\u001b[1m');

  String get backspace => '\b';

  Ansi(this.useAnsi);

  String get bullet => Platform.isWindows ? '-' : '•';

  String _code(String ansiCode) => useAnsi ? ansiCode : '';
}

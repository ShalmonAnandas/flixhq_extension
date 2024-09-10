import 'dart:convert';
import 'dart:typed_data';

List<dynamic> arr = List<dynamic>.filled(128, null);

class FakeWindow {
  final Map<String, String> localStorage = {};
  final bool webdriver = false;
  final String userAgent;
  final int length = 0;
  String cookie = '';
  final String origin = 'https://rabbitstream.net';
  final String href = 'https://rabbitstream.net/v2/embed-4/mcAWNPptFcOb?z=';
  final String locationOrigin = 'https://rabbitstream.net';
  final DateTime timeOrigin;
  String xrax = '';

  FakeWindow(this.userAgent, this.timeOrigin);

  void setItem(String item, String value) {
    localStorage[item] = value;
  }
}

class Meta {
  final String content;

  Meta(this.content);
}

class ImageData {
  final int height;
  final int width;
  final String data;

  ImageData(this.height, this.width, this.data);
}

class CanvasStyle {
  final String display;

  CanvasStyle(this.display);
}

class Canvas {
  final String baseUrl;
  final int width;
  final int height;
  final CanvasStyle style;

  Canvas(this.baseUrl, this.width, this.height, this.style);
}

class WasmObj {
  final Wbg wbg;

  WasmObj(this.wbg);
}

class Wbg {
  final Function(int, int) wbindgenStringGet;
  final Function(int) wbindgenObjectDropRef;
  final Function(int) wbindgenCbDrop;
  final Function(int, int) wbindgenStringNew;
  final Function(int) wbindgenIsNull;
  final Function(int) wbindgenIsUndefined;
  final Function(int) wbindgenBooleanGet;
  final Function wbgInstanceofCanvasRenderingContext2d;
  final Function wbgSetFillStyle;
  final Function wbgSetShadowBlur;
  final Function wbgSetShadowColor;
  final Function wbgSetFont;
  final Function wbgSetTextBaseline;
  final Function wbgDrawImage;
  final Function() wbgGetImageData;
  final Function wbgRect;
  final Function wbgFillRect;
  final Function wbgFillText;
  final Function wbgSetProperty;
  final Function() wbgCreateElement;
  final Function() wbgQuerySelector;
  final Function() wbgQuerySelectorAll;
  final Function(int, int, int, int) wbgGetAttribute;
  final Function(int) wbgTarget;
  final Function wbgAddEventListener;
  final Function wbgInstanceofHtmlCanvasElement;
  final Function(int, int) wbgSetWidth;
  final Function(int, int) wbgSetHeight;
  final Function() wbgGetContext;
  final Function() wbgToDataURL;
  final Function wbgInstanceofHtmlDocument;
  final Function(int, int) wbgCookie;
  final Function(int) wbgStyle;
  final Function wbgInstanceofHtmlImageElement;
  final Function(int, int) wbgSrc;
  final Function(int) wbgWidth;
  final Function(int) wbgHeight;
  final Function(int) wbgComplete;
  final Function(int, int) wbgData;
  final Function(int, int) wbgOrigin;
  final Function(int) wbgLength;
  final Function(int) wbgGet;
  final Function(int) wbgTimeOrigin;
  final Function wbgInstanceofWindow;
  final Function(int) wbgDocument;
  final Function(int) wbgLocation;
  final Function(int) wbgPerformance;
  final Function(int, int) wbgOrigin2;
  final Function(int) wbgGet2;
  final Function() wbgSetTimeout;
  final Function() wbgSelf;
  final Function() wbgWindow;
  final Function() wbgGlobalThis;
  final Function() wbgGlobal;
  final Function(int, int) wbgNewNoArgs;
  final Function(int) wbindgenObjectCloneRef;
  final Function(int, int) wbgEval;
  final Function(int, int) wbgCall;
  final Function(int, int, int) wbgSet;
  final Function(int) wbgBuffer;
  final Function(int, int, int) wbgNewWithByteOffsetAndLength;
  final Function(int) wbgNew;
  final Function(int) wbgBuffer2;
  final Function(int) wbgLength2;
  final Function(int, int, int) wbgSet2;
  final Function wbindgenDebugString;
  final Function(int, int) wbindgenThrow;
  final Function wbindgenMemory;
  final Function(int, int) wbindgenClosureWrapper93;
  final Function(int, int) wbindgenClosureWrapper95;
  final Function(int, int) wbindgenClosureWrapper97;
  final Function(int, int) wbindgenClosureWrapper99;
  final Function(int, int) wbindgenClosureWrapper101;

  Wbg({
    required this.wbindgenStringGet,
    required this.wbindgenObjectDropRef,
    required this.wbindgenCbDrop,
    required this.wbindgenStringNew,
    required this.wbindgenIsNull,
    required this.wbindgenIsUndefined,
    required this.wbindgenBooleanGet,
    required this.wbgInstanceofCanvasRenderingContext2d,
    required this.wbgSetFillStyle,
    required this.wbgSetShadowBlur,
    required this.wbgSetShadowColor,
    required this.wbgSetFont,
    required this.wbgSetTextBaseline,
    required this.wbgDrawImage,
    required this.wbgGetImageData,
    required this.wbgRect,
    required this.wbgFillRect,
    required this.wbgFillText,
    required this.wbgSetProperty,
    required this.wbgCreateElement,
    required this.wbgQuerySelector,
    required this.wbgQuerySelectorAll,
    required this.wbgGetAttribute,
    required this.wbgTarget,
    required this.wbgAddEventListener,
    required this.wbgInstanceofHtmlCanvasElement,
    required this.wbgSetWidth,
    required this.wbgSetHeight,
    required this.wbgGetContext,
    required this.wbgToDataURL,
    required this.wbgInstanceofHtmlDocument,
    required this.wbgCookie,
    required this.wbgStyle,
    required this.wbgInstanceofHtmlImageElement,
    required this.wbgSrc,
    required this.wbgWidth,
    required this.wbgHeight,
    required this.wbgComplete,
    required this.wbgData,
    required this.wbgOrigin,
    required this.wbgLength,
    required this.wbgGet,
    required this.wbgTimeOrigin,
    required this.wbgInstanceofWindow,
    required this.wbgDocument,
    required this.wbgLocation,
    required this.wbgPerformance,
    required this.wbgOrigin2,
    required this.wbgGet2,
    required this.wbgSetTimeout,
    required this.wbgSelf,
    required this.wbgWindow,
    required this.wbgGlobalThis,
    required this.wbgGlobal,
    required this.wbgNewNoArgs,
    required this.wbindgenObjectCloneRef,
    required this.wbgEval,
    required this.wbgCall,
    required this.wbgSet,
    required this.wbgBuffer,
    required this.wbgNewWithByteOffsetAndLength,
    required this.wbgNew,
    required this.wbgBuffer2,
    required this.wbgLength2,
    required this.wbgSet2,
    required this.wbindgenDebugString,
    required this.wbindgenThrow,
    required this.wbindgenMemory,
    required this.wbindgenClosureWrapper93,
    required this.wbindgenClosureWrapper95,
    required this.wbindgenClosureWrapper97,
    required this.wbindgenClosureWrapper99,
    required this.wbindgenClosureWrapper101,
  });
}

dynamic get(int index) {
  return arr[index];
}

Uint8List getMemBuff() {
  if (memoryBuff != null && memoryBuff!.isNotEmpty) {
    return memoryBuff!;
  } else {
    // Return a new Uint8List from the ByteBuffer
    return Uint8List.view(wasmMemoryBuffer.asUint8List().buffer);
  }
}

int parse(String text, Function(int, int) func,
    [Function(int, int, int, int)? func2]) {
  final encoder = Utf8Codec();
  final encoded = encoder.encode(text);

  if (func2 == null) {
    final parsedIndex = func(encoded.length, 1) >>> 0;
    final memBuff = getMemBuff();
    memBuff.setRange(parsedIndex, parsedIndex + encoded.length, encoded);
    size = encoded.length;
    return parsedIndex;
  }

  final len = text.length;
  var parsedLen = func(len, 1) >>> 0;
  final newArr = getMemBuff();
  var i = 0;

  while (i < len) {
    final char = text.codeUnitAt(i);
    if (char > 127) {
      break;
    }
    newArr[parsedLen + i] = char;
    i++;
  }

  if (i != len) {
    if (i != 0) {
      text = text.substring(i);
      parsedLen = func2!(parsedLen, len, i + 3 * text.length, 1) >>> 0;
      final newEncoded =
          newArr.sublist(parsedLen + i, parsedLen + i + 3 * text.length);
      final encoderResult = encode(text, newEncoded);
      i += encoderResult.written;
      parsedLen = func2(parsedLen, i, i, 1) >>> 0;
    }
  }

  size = i;
  return parsedLen;
}

WasmObj initWasm() {
  final wbg = Wbg(
    wbindgenStringGet: (offset, index) {
      String str = get(index) as String; // Get the string from the index
      int val = parse(str, wasm.__wbindgen_export_0,
          wasm.__wbindgen_export_1); // Parse the string

      Uint8List arr32 = getArr32(); // Get the array
      arr32[offset ~/ 4 + 1] = size; // Set the value at offset/4 + 1
      arr32[offset ~/ 4 + 0] = val; // Set the value at offset/4 + 0
    },
    wbindgenObjectDropRef: (index) {
      // Implement logic here
    },
    wbindgenCbDrop: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenStringNew: (index, offset) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenIsNull: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenIsUndefined: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenBooleanGet: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgInstanceofCanvasRenderingContext2d: () {
      // Implement logic here
      return true; // Adjust return value based on implementation
    },
    wbgSetFillStyle: () {
      // Implement logic here
    },
    wbgSetShadowBlur: () {
      // Implement logic here
    },
    wbgSetShadowColor: () {
      // Implement logic here
    },
    wbgSetFont: () {
      // Implement logic here
    },
    wbgSetTextBaseline: () {
      // Implement logic here
    },
    wbgDrawImage: () {
      // Implement logic here
    },
    wbgGetImageData: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgRect: () {
      // Implement logic here
    },
    wbgFillRect: () {
      // Implement logic here
    },
    wbgFillText: () {
      // Implement logic here
    },
    wbgSetProperty: () {
      // Implement logic here
    },
    wbgCreateElement: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgQuerySelector: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgQuerySelectorAll: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgGetAttribute: (offset, index, decodeIndex, decodeOffset) {
      // Implement logic here
    },
    wbgTarget: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgAddEventListener: () {
      // Implement logic here
    },
    wbgInstanceofHtmlCanvasElement: () {
      // Implement logic here
      return true; // Adjust return value based on implementation
    },
    wbgSetWidth: (index, set) {
      // Implement logic here
    },
    wbgSetHeight: (index, set) {
      // Implement logic here
    },
    wbgGetContext: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgToDataURL: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgInstanceofHtmlDocument: () {
      // Implement logic here
      return true; // Adjust return value based on implementation
    },
    wbgCookie: (offset, index) {
      // Implement logic here
    },
    wbgStyle: (index) {
      // Implement logic here
    },
    wbgInstanceofHtmlImageElement: () {
      // Implement logic here
      return true; // Adjust return value based on implementation
    },
    wbgSrc: (offset, index) {
      // Implement logic here
    },
    wbgWidth: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgHeight: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgComplete: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgData: (offset, index) {
      // Implement logic here
    },
    wbgOrigin: (offset, index) {
      // Implement logic here
    },
    wbgLength: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgGet: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgTimeOrigin: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgInstanceofWindow: () {
      // Implement logic here
      return true; // Adjust return value based on implementation
    },
    wbgDocument: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgLocation: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgPerformance: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgOrigin2: (offset, index) {
      // Implement logic here
    },
    wbgGet2: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgSetTimeout: () {
      // Implement logic here
      return 10; // Adjust return value based on implementation
    },
    wbgSelf: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgWindow: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgGlobalThis: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgGlobal: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgNewNoArgs: (index, offset) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenObjectCloneRef: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgEval: (index, offset) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgCall: (index, index2) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgSet: (index, index2, index3) {
      // Implement logic here
    },
    wbgBuffer: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgNewWithByteOffsetAndLength: (index, val, val2) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgNew: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgBuffer2: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgLength2: (index) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbgSet2: (index, index2, val) {
      // Implement logic here
    },
    wbindgenDebugString: () {
      // Implement logic here
    },
    wbindgenThrow: (index, offset) {
      throw Exception(decodeSub(index, offset));
    },
    wbindgenMemory: () {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenClosureWrapper93: (Qn, QT) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenClosureWrapper95: (Qn, QT) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenClosureWrapper97: (Qn, QT) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenClosureWrapper99: (Qn, QT) {
      // Implement logic here
      return 0; // Adjust return value based on implementation
    },
    wbindgenClosureWrapper101: (Qn, QT) {
      // Implement logic here
    },
  );

  return WasmObj(wbg);
}

String decodeSub(int index, int offset, Uint8List memoryBuffer) {
  // Ensure index and offset are non-negative and within bounds
  if (index < 0 || offset < 0 || index + offset > memoryBuffer.length) {
    throw ArgumentError(
        'Index and offset must be within the bounds of the memory buffer.');
  }

  // Extract the subarray from the memory buffer
  Uint8List subarray = memoryBuffer.sublist(index, index + offset);

  // Decode the subarray into a string
  Utf8Codec decoder = Utf8Codec();
  return decoder.decode(subarray);
}

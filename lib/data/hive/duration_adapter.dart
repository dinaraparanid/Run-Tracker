import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

@immutable
final class DurationAdapter extends TypeAdapter<Duration> {
  final typeId = 32;

  @override
  Duration read(BinaryReader reader) => Duration(seconds: reader.read());

  @override
  void write(BinaryWriter writer, Duration obj) =>
      writer.write(obj.inMilliseconds);
}

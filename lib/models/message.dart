import "package:storytext/models/choice.dart";
import "package:storytext/models/persona.dart";
import "package:storytext/static/keys.dart";
import "package:yaml/yaml.dart";

typedef MessageId = String;

class Message {
  final PersonaId personaId;
  final String? text;
  final String? image;
  final String? imageSource;
  final String? next;
  final List<Choice>? mcq;

  Message({
    required this.personaId,
    required this.text,
    required this.image,
    required this.imageSource,
    required this.next,
    required this.mcq,
  });

  factory Message.fromMap(YamlMap message) {
    return Message(
      personaId: message[YamlKeys.msgPersona],
      text: message[YamlKeys.msgText],
      image: message[YamlKeys.msgImage],
      imageSource: message[YamlKeys.msgImageSource],
      next: message[YamlKeys.msgNext],
      mcq: Choice.fromMcq(message[YamlKeys.msgMcq]),
    );
  }

  factory Message.fromDocument(YamlMap document, MessageId id) {
    return Message.fromMap(document[id]);
  }

  static bool existsInDocument(YamlMap document, MessageId id) {
    return document[id] != null;
  }
}

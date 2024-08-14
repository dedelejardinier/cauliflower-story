import "package:storytext/static/keys.dart";
import "package:yaml/yaml.dart";

typedef PersonaId = String;

class Persona {
  final String name;
  final int age;

  Persona({
    required this.name,
    required this.age,
  });

  factory Persona.fromMap(YamlMap persona) {
    return Persona(
      name: persona[YamlKeys.personaName],
      age: persona[YamlKeys.personaAge],
    );
  }

  factory Persona.fromDocument(YamlMap document, PersonaId id) {
    return Persona.fromMap(document[YamlKeys.personas][id]);
  }
}

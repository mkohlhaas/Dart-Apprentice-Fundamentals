class User {
  final String _name;                                     // final fields can only be set in the constructor
  final int _id;

  const User({int id = 0, String name = 'anonymous'})     // because all fields are final we can make the constructor 'const'
      : _id = id,                                         // => all instances will be constants at compile-time
        _name = name;                                     // CANONICAL INSTANCES: only one instance is created for the same inputs

  const User.anonymous() : this();                        // also creates a CANONICAL INSTANCE; there will be only one no matter how often you call this constructor! => huge performance win!

  factory User.fromJson(Map<String, Object> json) {       // factory constructors can return new or existing instances of the class, or even subclasses of it
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User(id: userId, name: userName);
  }

  String toJson() {
    return '{"id":$_id,"name":"$_name"}';
  }

  @override
  String toString() {
    return 'User(id: $_id, name: $_name)';
  }
}

// Constructors can be:
// - (non-)forwarding
// - (un-)named
// - (non-)generative
// - factory
// - with/without parameters
// - (non-)constant
// - short-form
// - long-form
// - public
// - private

// Many of those options can vary independently of each other.

// public, non-forwarding, unnamed, generative, const constructor with parameters.
// const User(this.id, this.name);

// private, non-forwarding, named, generative, non-constant constructor without parameters:
// DatabaseHelper._internal();

// Use a factory in situations where you don't necessarily want to return a new instance of the class itself. Use cases:
// - the constructor is expensive, so you want to return an existing instance instead of creating a new one
// - you only ever want to create one instance of a class (the singleton pattern)
// - you want to return a subclass instance instead of the class itself

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MessageDao? _messageDaoInstance;

  SessionDao? _sessionDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Message` (`id` TEXT NOT NULL, `content` TEXT NOT NULL, `isUser` INTEGER NOT NULL, `timestamp` INTEGER NOT NULL, `session_id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Session` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `model` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MessageDao get messageDao {
    return _messageDaoInstance ??= _$MessageDao(database, changeListener);
  }

  @override
  SessionDao get sessionDao {
    return _sessionDaoInstance ??= _$SessionDao(database, changeListener);
  }
}

class _$MessageDao extends MessageDao {
  _$MessageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _messageInsertionAdapter = InsertionAdapter(
            database,
            'Message',
            (Message item) => <String, Object?>{
                  'id': item.id,
                  'content': item.content,
                  'isUser': item.isUser ? 1 : 0,
                  'timestamp': _dateTimeConverter.encode(item.timestamp),
                  'session_id': item.sessionId
                }),
        _messageDeletionAdapter = DeletionAdapter(
            database,
            'Message',
            ['id'],
            (Message item) => <String, Object?>{
                  'id': item.id,
                  'content': item.content,
                  'isUser': item.isUser ? 1 : 0,
                  'timestamp': _dateTimeConverter.encode(item.timestamp),
                  'session_id': item.sessionId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Message> _messageInsertionAdapter;

  final DeletionAdapter<Message> _messageDeletionAdapter;

  @override
  Future<List<Message>> findAllMessages() async {
    return _queryAdapter.queryList('SELECT * FROM Message',
        mapper: (Map<String, Object?> row) => Message(
            id: row['id'] as String,
            content: row['content'] as String,
            isUser: (row['isUser'] as int) != 0,
            timestamp: _dateTimeConverter.decode(row['timestamp'] as int),
            sessionId: row['session_id'] as int?));
  }

  @override
  Future<Message?> findMessageById(String id) async {
    return _queryAdapter.query('SELECT * FROM Message WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Message(
            id: row['id'] as String,
            content: row['content'] as String,
            isUser: (row['isUser'] as int) != 0,
            timestamp: _dateTimeConverter.decode(row['timestamp'] as int),
            sessionId: row['session_id'] as int?),
        arguments: [id]);
  }

  @override
  Future<List<Message>> findMessagesBySessionId(int sessionId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Message WHERE session_id = ?1',
        mapper: (Map<String, Object?> row) => Message(
            id: row['id'] as String,
            content: row['content'] as String,
            isUser: (row['isUser'] as int) != 0,
            timestamp: _dateTimeConverter.decode(row['timestamp'] as int),
            sessionId: row['session_id'] as int?),
        arguments: [sessionId]);
  }

  @override
  Future<void> upsertMessage(Message message) async {
    await _messageInsertionAdapter.insert(message, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteMessage(Message message) async {
    await _messageDeletionAdapter.delete(message);
  }
}

class _$SessionDao extends SessionDao {
  _$SessionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sessionInsertionAdapter = InsertionAdapter(
            database,
            'Session',
            (Session item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'model': item.model
                }),
        _sessionDeletionAdapter = DeletionAdapter(
            database,
            'Session',
            ['id'],
            (Session item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'model': item.model
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Session> _sessionInsertionAdapter;

  final DeletionAdapter<Session> _sessionDeletionAdapter;

  @override
  Future<List<Session>> findAllSessions() async {
    return _queryAdapter.queryList('SELECT * FROM Session ORDER BY id DESC',
        mapper: (Map<String, Object?> row) => Session(
            id: row['id'] as int?,
            title: row['title'] as String,
            model: row['model'] as String));
  }

  @override
  Future<Session?> findSessionById(int id) async {
    return _queryAdapter.query('SELECT * FROM Session WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Session(
            id: row['id'] as int?,
            title: row['title'] as String,
            model: row['model'] as String),
        arguments: [id]);
  }

  @override
  Future<int> upsertSession(Session session) {
    return _sessionInsertionAdapter.insertAndReturnId(
        session, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteSession(Session session) async {
    await _sessionDeletionAdapter.delete(session);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();

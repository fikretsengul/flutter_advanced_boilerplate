// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:http/http.dart';
import 'package:flutter_advanced_boilerplate/modules/graphql/scalars/upload_scalar.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class PostsPaginated$Query$Posts$Data extends JsonSerializable
    with EquatableMixin {
  PostsPaginated$Query$Posts$Data();

  factory PostsPaginated$Query$Posts$Data.fromJson(Map<String, dynamic> json) =>
      _$PostsPaginated$Query$Posts$DataFromJson(json);

  String? id;

  String? title;

  @override
  List<Object?> get props => [id, title];

  @override
  Map<String, dynamic> toJson() =>
      _$PostsPaginated$Query$Posts$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostsPaginated$Query$Posts$Meta extends JsonSerializable
    with EquatableMixin {
  PostsPaginated$Query$Posts$Meta();

  factory PostsPaginated$Query$Posts$Meta.fromJson(Map<String, dynamic> json) =>
      _$PostsPaginated$Query$Posts$MetaFromJson(json);

  int? totalCount;

  @override
  List<Object?> get props => [totalCount];

  @override
  Map<String, dynamic> toJson() =>
      _$PostsPaginated$Query$Posts$MetaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostsPaginated$Query$Posts extends JsonSerializable with EquatableMixin {
  PostsPaginated$Query$Posts();

  factory PostsPaginated$Query$Posts.fromJson(Map<String, dynamic> json) =>
      _$PostsPaginated$Query$PostsFromJson(json);

  List<PostsPaginated$Query$Posts$Data?>? data;

  PostsPaginated$Query$Posts$Meta? meta;

  @override
  List<Object?> get props => [data, meta];

  @override
  Map<String, dynamic> toJson() => _$PostsPaginated$Query$PostsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostsPaginated$Query extends JsonSerializable with EquatableMixin {
  PostsPaginated$Query();

  factory PostsPaginated$Query.fromJson(Map<String, dynamic> json) =>
      _$PostsPaginated$QueryFromJson(json);

  PostsPaginated$Query$Posts? posts;

  @override
  List<Object?> get props => [posts];

  @override
  Map<String, dynamic> toJson() => _$PostsPaginated$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PageQueryOptions extends JsonSerializable with EquatableMixin {
  PageQueryOptions({
    this.paginate,
    this.slice,
    this.sort,
    this.operators,
    this.search,
  });

  factory PageQueryOptions.fromJson(Map<String, dynamic> json) =>
      _$PageQueryOptionsFromJson(json);

  PaginateOptions? paginate;

  SliceOptions? slice;

  List<SortOptions?>? sort;

  List<OperatorOptions?>? operators;

  SearchOptions? search;

  @override
  List<Object?> get props => [paginate, slice, sort, operators, search];

  @override
  Map<String, dynamic> toJson() => _$PageQueryOptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaginateOptions extends JsonSerializable with EquatableMixin {
  PaginateOptions({
    this.page,
    this.limit,
  });

  factory PaginateOptions.fromJson(Map<String, dynamic> json) =>
      _$PaginateOptionsFromJson(json);

  int? page;

  int? limit;

  @override
  List<Object?> get props => [page, limit];

  @override
  Map<String, dynamic> toJson() => _$PaginateOptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SliceOptions extends JsonSerializable with EquatableMixin {
  SliceOptions({
    this.start,
    this.end,
    this.limit,
  });

  factory SliceOptions.fromJson(Map<String, dynamic> json) =>
      _$SliceOptionsFromJson(json);

  int? start;

  int? end;

  int? limit;

  @override
  List<Object?> get props => [start, end, limit];

  @override
  Map<String, dynamic> toJson() => _$SliceOptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SortOptions extends JsonSerializable with EquatableMixin {
  SortOptions({
    this.field,
    this.order,
  });

  factory SortOptions.fromJson(Map<String, dynamic> json) =>
      _$SortOptionsFromJson(json);

  String? field;

  @JsonKey(unknownEnumValue: SortOrderEnum.artemisUnknown)
  SortOrderEnum? order;

  @override
  List<Object?> get props => [field, order];

  @override
  Map<String, dynamic> toJson() => _$SortOptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OperatorOptions extends JsonSerializable with EquatableMixin {
  OperatorOptions({
    this.kind,
    this.field,
    this.value,
  });

  factory OperatorOptions.fromJson(Map<String, dynamic> json) =>
      _$OperatorOptionsFromJson(json);

  @JsonKey(unknownEnumValue: OperatorKindEnum.artemisUnknown)
  OperatorKindEnum? kind;

  String? field;

  String? value;

  @override
  List<Object?> get props => [kind, field, value];

  @override
  Map<String, dynamic> toJson() => _$OperatorOptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchOptions extends JsonSerializable with EquatableMixin {
  SearchOptions({this.q});

  factory SearchOptions.fromJson(Map<String, dynamic> json) =>
      _$SearchOptionsFromJson(json);

  String? q;

  @override
  List<Object?> get props => [q];

  @override
  Map<String, dynamic> toJson() => _$SearchOptionsToJson(this);
}

enum SortOrderEnum {
  @JsonValue('ASC')
  asc,
  @JsonValue('DESC')
  desc,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum OperatorKindEnum {
  @JsonValue('GTE')
  gte,
  @JsonValue('LTE')
  lte,
  @JsonValue('NE')
  ne,
  @JsonValue('LIKE')
  like,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class PostsPaginatedArguments extends JsonSerializable with EquatableMixin {
  PostsPaginatedArguments({this.options});

  @override
  factory PostsPaginatedArguments.fromJson(Map<String, dynamic> json) =>
      _$PostsPaginatedArgumentsFromJson(json);

  final PageQueryOptions? options;

  @override
  List<Object?> get props => [options];

  @override
  Map<String, dynamic> toJson() => _$PostsPaginatedArgumentsToJson(this);
}

final POSTS_PAGINATED_QUERY_DOCUMENT_OPERATION_NAME = 'PostsPaginated';
final POSTS_PAGINATED_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'PostsPaginated'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'options')),
        type: NamedTypeNode(
          name: NameNode(value: 'PageQueryOptions'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'posts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'options'),
            value: VariableNode(name: NameNode(value: 'options')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'data'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'meta'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class PostsPaginatedQuery
    extends GraphQLQuery<PostsPaginated$Query, PostsPaginatedArguments> {
  PostsPaginatedQuery({required this.variables});

  @override
  final DocumentNode document = POSTS_PAGINATED_QUERY_DOCUMENT;

  @override
  final String operationName = POSTS_PAGINATED_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final PostsPaginatedArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];

  @override
  PostsPaginated$Query parse(Map<String, dynamic> json) =>
      PostsPaginated$Query.fromJson(json);
}

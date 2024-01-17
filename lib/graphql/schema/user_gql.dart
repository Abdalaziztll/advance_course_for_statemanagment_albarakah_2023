

const String userGql = r'''
query $options: PageQueryOptions {
  posts(options: $options){
    data {
      id
      title
    }
    meta {
      totalCount
    }
  }
}
''';



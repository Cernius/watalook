import 'package:flutter/material.dart';
import 'package:watalook/common/app_module.dart';
import 'package:watalook/presentation/first_page/bloc/first_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  final String readRepositories = """
  query ReadRepositories(\$nRepositories: Int!) {
    viewer {
      repositories(last: \$nRepositories) {
        nodes {
          id
          name
          viewerHasStarred
        }
      }
    }
  }
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<FirstPageBloc>(
        create: (context) {
          final bloc = injector.get<FirstPageBloc>();
          bloc.getData();
          return bloc;
        },
        child: BlocBuilder<FirstPageBloc, void>(
          builder: (context, state) {
            return Query(
              options: QueryOptions(
                document: gql(readRepositories),
                // this is the query string you just created
                variables: {
                  'nRepositories': 50,
                },
                pollInterval: const Duration(seconds: 10),
              ),
              // Just like in apollo refetch() could be used to manually trigger a refetch
              // while fetchMore() can be used for pagination purpose
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading) {
                  return const Text('Loading');
                }

                List? repositories =
                    result.data?['viewer']?['repositories']?['nodes'];

                if (repositories == null) {
                  return const Text('No repositories');
                }

                return ListView.builder(
                    itemCount: repositories.length,
                    itemBuilder: (context, index) {
                      final repository = repositories[index];

                      return Text(repository['name'] ?? '');
                    });
              },
            );
          },
        ),
      ),
    );
  }
}
